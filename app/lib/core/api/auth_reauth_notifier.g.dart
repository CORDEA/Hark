// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_reauth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Set of server URLs whose stored JWT has been rejected by the backend and
/// needs a fresh assertion ceremony before the profile is usable again.
///
/// Populated by [AuthInterceptor] when the server returns 401. Consumed by
/// the org-list view model so a row can render a "Reconnect" affordance
/// instead of pretending the profile is healthy.

@ProviderFor(AuthReauthNotifier)
final authReauthProvider = AuthReauthNotifierProvider._();

/// Set of server URLs whose stored JWT has been rejected by the backend and
/// needs a fresh assertion ceremony before the profile is usable again.
///
/// Populated by [AuthInterceptor] when the server returns 401. Consumed by
/// the org-list view model so a row can render a "Reconnect" affordance
/// instead of pretending the profile is healthy.
final class AuthReauthNotifierProvider
    extends $NotifierProvider<AuthReauthNotifier, Set<String>> {
  /// Set of server URLs whose stored JWT has been rejected by the backend and
  /// needs a fresh assertion ceremony before the profile is usable again.
  ///
  /// Populated by [AuthInterceptor] when the server returns 401. Consumed by
  /// the org-list view model so a row can render a "Reconnect" affordance
  /// instead of pretending the profile is healthy.
  AuthReauthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authReauthProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authReauthNotifierHash();

  @$internal
  @override
  AuthReauthNotifier create() => AuthReauthNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$authReauthNotifierHash() =>
    r'bc33602fec55e09d97ca8dc98e0b4926de34f673';

/// Set of server URLs whose stored JWT has been rejected by the backend and
/// needs a fresh assertion ceremony before the profile is usable again.
///
/// Populated by [AuthInterceptor] when the server returns 401. Consumed by
/// the org-list view model so a row can render a "Reconnect" affordance
/// instead of pretending the profile is healthy.

abstract class _$AuthReauthNotifier extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
