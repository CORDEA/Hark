import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_type_dto.freezed.dart';
part 'alert_type_dto.g.dart';

@freezed
abstract class AlertTypeDto with _$AlertTypeDto {
  const factory AlertTypeDto({
    required String id,
    required String name,
    @Default('') String description,
    required String color,
  }) = _AlertTypeDto;

  factory AlertTypeDto.fromJson(Map<String, dynamic> json) =>
      _$AlertTypeDtoFromJson(json);
}
