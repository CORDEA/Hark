// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_type_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertTypeDto _$AlertTypeDtoFromJson(Map<String, dynamic> json) =>
    _AlertTypeDto(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      color: json['color'] as String,
    );

Map<String, dynamic> _$AlertTypeDtoToJson(_AlertTypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
    };
