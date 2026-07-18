# Flutter rules

## Architecture: MVVM + UseCase + Repository

Follow a strict layered architecture. Each layer has a single responsibility and dependencies only flow inward.

```
lib/
  features/
    recipe/
      data/
        recipe_repository.dart        # concrete class, no interface needed
        recipe_remote_data_source.dart
        recipe_dto.dart               # freezed, raw API shape
      domain/
        get_recipes_use_case.dart
      presentation/
        recipe_view_model.dart        # @riverpod, holds AsyncValue<ViewState>
        recipe_view_state.dart        # freezed ViewState
        list_recipe_page.dart         # ConsumerWidget, reads ViewModel
        recipe_card.dart              # pure widget, no provider access
```

**Naming conventions:**

| Layer | Convention | Example |
|---|---|---|
| Page class | starts with verb | `ListRecipePage`, `EditRecipePage`, `ViewRecipeDetailPage` |
| Page file | ends with `_page.dart` | `list_recipe_page.dart`, `edit_recipe_page.dart` |
| UseCase class | starts with verb | `GetRecipesUseCase`, `DeleteRecipeUseCase` |
| UseCase method | always `execute` | `execute()` |
| Repository class | starts with noun | `RecipeRepository`, `UserRepository` |
| Repository methods | verb describing data access | `findAll`, `findById`, `save`, `delete` |
| ViewModel methods | user interaction event | `onTapped`, `onValueChanged`, `onSubmitted` |

**Layer access** — dependencies only flow inward. UI must never access a UseCase or Repository directly:

```
UI (page/widget)  →  ViewModel  →  UseCase  →  Repository
```

**ViewState** — a freezed class with only the properties the UI needs. Never expose DTOs or domain models to the presentation layer:

```dart
// presentation/recipe_view_state.dart
@freezed
class RecipeViewState with _$RecipeViewState {
  const factory RecipeViewState({
    required String id,
    required String title,
    required String thumbnailUrl,
  }) = _RecipeViewState;
}
```

**ViewModel** — maps UseCase output to `ViewState`, exposes `AsyncValue<T>`. Follows uni-directional data flow: all public methods return `void` or `Future<void>` and update state internally. Method names reflect user interactions:

```dart
// presentation/recipe_view_model.dart
@riverpod
class RecipeViewModel extends _$RecipeViewModel {
  @override
  Future<List<RecipeViewState>> build() async {
    final recipes = await ref.watch(getRecipesUseCaseProvider).execute();
    return recipes.map((r) => RecipeViewState(
      id: r.id,
      title: r.title,
      thumbnailUrl: r.thumbnailUrl,
    )).toList();
  }

  Future<void> onDeleteTapped(String id) async {
    await ref.read(deleteRecipeUseCaseProvider).execute(id);
    ref.invalidateSelf();
  }
}
```

**ViewEvent** — when the ViewModel needs to trigger a one-time UI side effect (navigation, snackbar, dialog, form validation), define a sealed `ViewEvent` union and observe it with `ref.listen` in the page. The page must call `onEventConsumed()` after handling so the event is not replayed. Events that destroy the widget (navigation) do not need `onEventConsumed()`.

```dart
// presentation/recipe_view_state.dart
@freezed
sealed class RecipeViewEvent with _$RecipeViewEvent {
  const factory RecipeViewEvent.none() = RecipeViewEventNone;
  const factory RecipeViewEvent.requestValidation() = RecipeViewEventRequestValidation;
  const factory RecipeViewEvent.showSnackBar(String message) = RecipeViewEventShowSnackBar;
  const factory RecipeViewEvent.navigateToHome() = RecipeViewEventNavigateToHome;
}

@freezed
class RecipeViewState with _$RecipeViewState {
  const factory RecipeViewState({
    required String id,
    required String title,
    @Default(RecipeViewEvent.none()) RecipeViewEvent event,
  }) = _RecipeViewState;
}
```

```dart
// presentation/recipe_view_model.dart

// Trigger UI validation first; the page calls onValidationPassed or
// onEventConsumed depending on the result.
void onSubmitTapped() {
  if (state.isSending) return;
  state = state.copyWith(event: const RecipeViewEvent.requestValidation());
}

Future<void> onValidationPassed() async {
  state = state.copyWith(isSending: true, event: const RecipeViewEvent.none());
  try {
    // ... business logic using state fields ...
    state = state.copyWith(isSending: false, event: const RecipeViewEvent.navigateToHome());
  } catch (_) {
    state = state.copyWith(isSending: false, event: const RecipeViewEvent.showSnackBar('Error'));
  }
}

void onEventConsumed() {
  state = state.copyWith(event: const RecipeViewEvent.none());
}
```

```dart
// presentation/list_recipe_page.dart
ref.listen(
  recipeViewModelProvider.select((s) => s.event),
  (_, event) {
    switch (event) {
      case RecipeViewEventRequestValidation():
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          ref.read(recipeViewModelProvider.notifier).onValidationPassed();
        } else {
          ref.read(recipeViewModelProvider.notifier).onEventConsumed();
        }
      case RecipeViewEventShowSnackBar(:final message):
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
          ref.read(recipeViewModelProvider.notifier).onEventConsumed();
        }
      case RecipeViewEventNavigateToHome():
        if (context.mounted) context.go('/home');
      case RecipeViewEventNone():
        break;
    }
  },
);
```

**UseCase** — named with a verb, one public method named `execute`:

```dart
@riverpod
GetRecipesUseCase getRecipesUseCase(Ref ref) =>
    GetRecipesUseCase(ref.watch(recipeRepositoryProvider));

class GetRecipesUseCase {
  const GetRecipesUseCase(this._repository);
  final RecipeRepository _repository;

  Future<List<RecipeDto>> execute() => _repository.findAll();
}
```

**Repository** — concrete class, no interface needed. Named with a noun, methods named as data-access verbs:

```dart
// data/recipe_repository.dart
@Riverpod(keepAlive: true)
RecipeRepository recipeRepository(Ref ref) => RecipeRepository(...);

class RecipeRepository {
  Future<List<RecipeDto>> findAll() async { ... }
  Future<RecipeDto> findById(String id) async { ... }
  Future<void> save(RecipeDto dto) async { ... }
  Future<void> delete(String id) async { ... }
}
```

**DTO** — a freezed class representing the raw data shape from an API or local source:

```dart
// data/recipe_dto.dart
@freezed
class RecipeDto with _$RecipeDto {
  const factory RecipeDto({
    required String id,
    required String title,
    required String thumbnailUrl,
    required List<String> ingredientIds,
  }) = _RecipeDto;

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);
}
```

Use freezed classes whenever the object is a value type: `ViewState`, `Dto`, domain models passed between layers.

---

## Minimal Rebuild Scope

Always use `.select(...)` when reading from a provider in a widget. Never watch the root state directly — doing so rebuilds the widget on every state change, even unrelated ones.

```dart
// Bad — rebuilds on any change to recipeViewModelProvider
final state = ref.watch(recipeViewModelProvider);

// Good — rebuilds only when the list itself changes
final recipes = ref.watch(
  recipeViewModelProvider.select((s) => s.valueOrNull ?? []),
);
```

For `AsyncValue`, select into the data you need rather than calling `.when` at the top level:

```dart
// Bad
final state = ref.watch(recipeViewModelProvider);
return state.when(
  data: (recipes) => RecipeList(recipes: recipes),
  loading: () => const CircularProgressIndicator(),
  error: (e, _) => ErrorView(error: e),
);

// Good — each widget rebuilds only for its own slice
final isLoading = ref.watch(
  recipeViewModelProvider.select((s) => s.isLoading),
);
final recipes = ref.watch(
  recipeViewModelProvider.select((s) => s.valueOrNull ?? []),
);
```

Narrow the rebuild scope further by wrapping the changing part in a `Consumer` or splitting it into a dedicated `ConsumerWidget`. Each independently-reactive widget (a toggle, a button whose enabled state changes, a label showing a single field) should have its own `Consumer` so it rebuilds in isolation:

```dart
// Consumer — each widget rebuilds only when its own slice changes
class EditRecipePage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    // static layout — never rebuilds due to provider changes
    return Scaffold(
      appBar: AppBar(title: Text(l10n.editRecipe)),
      body: Column(
        children: [
          TextFormField(controller: textController, ...),
          Consumer(
            builder: (context, ref, _) {
              final pinned = ref.watch(
                recipeViewModelProvider.select((s) => s.pinned),
              );
              return SwitchListTile(
                value: pinned,
                onChanged: (v) =>
                    ref.read(recipeViewModelProvider.notifier).onPinnedChanged(v),
              );
            },
          ),
          Consumer(
            builder: (context, ref, _) {
              final isSaving = ref.watch(
                recipeViewModelProvider.select((s) => s.isSaving),
              );
              return FilledButton(
                onPressed: isSaving
                    ? null
                    : () => ref.read(recipeViewModelProvider.notifier).onSaveTapped(),
                child: Text(l10n.save),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Dedicated ConsumerWidget — when the slice is reused or complex
class RecipeListSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(
      recipeViewModelProvider.select((s) => s.valueOrNull ?? []),
    );
    return RecipeList(recipes: recipes);
  }
}
```

---

## Form Fields and ViewModel State

Form field values belong in `ViewState`, not in local widget state or as parameters passed to ViewModel methods. Drive ViewModel state with `onChanged` and let the ViewModel read from `state` in its action methods.

```dart
// Bad — text passed as a parameter; ViewModel has no record of it between calls
Future<void> onSendTapped(String text) async {
  await _repository.save(text: text, type: state.type);
}

// Good — ViewModel owns all input state
void onTextChanged(String value) => state = state.copyWith(text: value);

Future<void> onValidationPassed() async {
  await _repository.save(text: state.text, type: state.type);
}
```

```dart
// In the page — controller kept for cursor/selection UX; onChanged syncs to ViewModel
TextFormField(
  controller: textController,
  onChanged: (value) =>
      ref.read(recipeViewModelProvider.notifier).onTextChanged(value),
  ...
),
```

Use `useMemoized(() => GlobalKey<FormState>())` to keep the form key stable across rebuilds when using `HookConsumerWidget`.

---

## Riverpod: Use `riverpod_annotation`

Always use code generation. Never write providers by hand.

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipe_view_model.g.dart';

@riverpod
class RecipeViewModel extends _$RecipeViewModel { ... }

@Riverpod(keepAlive: true)
RecipeRepository recipeRepository(Ref ref) => RecipeRepositoryImpl();
```

Run `dart run build_runner watch` during development.

---

## Hooks over StatefulWidget

Never use `StatefulWidget` for local widget state. Use `HookWidget` or `HookConsumerWidget` from `flutter_hooks` instead. Hooks keep lifecycle logic co-located and avoid the boilerplate of `initState` / `dispose`:

```dart
// Bad
class RecipeSearchPage extends StatefulWidget { ... }
class _RecipeSearchPageState extends State<RecipeSearchPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  ...
}

// Good
class RecipeSearchPage extends HookConsumerWidget {
  const RecipeSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final isFocused = useState(false);
    ...
  }
}
```

Common hooks: `useTextEditingController`, `useAnimationController`, `useState`, `useEffect`, `useMemoized`.

---

## Colors

Never use raw `Colors.*` or hex literals directly in widgets. All colors must be defined through `ColorScheme` or a `ThemeExtension`:

```dart
// theme/app_color_scheme_extension.dart
@immutable
class AppColorSchemeExtension extends ThemeExtension<AppColorSchemeExtension> {
  const AppColorSchemeExtension({required this.warning});
  final Color warning;

  @override
  AppColorSchemeExtension copyWith({Color? warning}) =>
      AppColorSchemeExtension(warning: warning ?? this.warning);

  @override
  AppColorSchemeExtension lerp(AppColorSchemeExtension? other, double t) =>
      AppColorSchemeExtension(
        warning: Color.lerp(warning, other?.warning, t) ?? warning,
      );
}

// Access in widgets:
Theme.of(context).extension<AppColorSchemeExtension>()!.warning
Theme.of(context).colorScheme.primary
```

---

## Pre-Commit Checklist

Before every commit, run all three in order:

```sh
dart analyze
dart format .
flutter test
```

All three must pass with no errors. Fix any issues before committing — do not suppress warnings with `// ignore` unless there is no other option, and always include the specific lint rule name.

---

## Localization

All user-visible strings must be defined in an `.arb` file. Never hardcode strings in widget code.

```arb
// lib/l10n/app_en.arb
{
  "recipeListTitle": "Recipes",
  "@recipeListTitle": { "description": "Title for the recipe list page" },
  "recipeCount": "{count, plural, one{{count} recipe} other{{count} recipes}}",
  "@recipeCount": {
    "placeholders": { "count": { "type": "int" } }
  }
}
```

```dart
// In widget:
Text(AppLocalizations.of(context)!.recipeListTitle)
```

---

## Effective Dart

Follow https://dart.dev/effective-dart. Key rules enforced in this project:

**Style**
- Types: `UpperCamelCase` — `RecipeRepository`, `AppTheme`
- Variables, parameters, named constructors: `lowerCamelCase` — `recipeList`, `fetchData`
- Files, packages, directories: `lowercase_with_underscores` — `recipe_repository.dart`
- Constants: `lowerCamelCase` — `const defaultTimeout = Duration(seconds: 30)`

**Design**
- Prefer `final` fields; avoid mutable state outside of notifiers
- Prefer composition over inheritance; avoid `abstract interface class` unless a type is genuinely shared across multiple implementations
- Avoid `dynamic`; use generics or sealed classes instead
- Prefer named parameters when a function has more than two parameters or when the purpose of a parameter is not obvious from its type
- Return `Future` not `void` from async functions so callers can await errors

**Usage**
- Use collection literals (`[]`, `{}`) instead of constructors (`List()`, `Map()`)
- Prefer `?.`, `??`, and `??=` over explicit null checks
- Use `whereType<T>()` instead of `where((e) => e is T).cast<T>()`
- Avoid `late` unless truly necessary; prefer nullable or a factory pattern
- Prefer `const` constructors everywhere they apply

**Documentation**
- Write `///` doc comments only on public API (classes, methods in the domain and data layers)
- Omit doc comments on private members and widget `build` methods

---

## Comments

Comments explain **why** something is done, not **what** the code does. Well-named identifiers already communicate what.

```dart
// Bad — states the obvious
// Increment the counter
counter++;

// Bad — describes the what
// Filter recipes by the user's dietary preference
final filtered = recipes.where((r) => r.tags.contains(preference));

// Good — explains a non-obvious constraint
// The API returns duplicates when paginating across a deleted item; deduplicate by id.
final unique = {...recipes.map((r) => MapEntry(r.id, r))}.values.toList();
```

Omit comments entirely when the code is self-explanatory. Never write block comment headers or section dividers.

---

## Spacing / Gaps

Use multiples of **8** for gaps, padding, and margins. For fine-grained alignment only, multiples of **4** are allowed.

```dart
// Preferred
const SizedBox(height: 16)
const SizedBox(width: 8)
EdgeInsets.all(24)
EdgeInsets.symmetric(horizontal: 16, vertical: 8)

// Fine-grained only
const SizedBox(height: 4)   // e.g., between a label and its helper text

// Never
const SizedBox(height: 10)
const SizedBox(height: 15)
EdgeInsets.all(6)
```

Define reusable spacing constants in a single file rather than scattering magic numbers:

```dart
// theme/app_spacing.dart
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}
```
