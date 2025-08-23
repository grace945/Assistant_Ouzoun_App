// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'off_days_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VacationModel _$VacationModelFromJson(Map<String, dynamic> json) =>
    VacationModel(
      id: (json['id'] as num).toInt(),
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
      note: json['note'] as String,
      status: VacationModel._statusFromJson((json['status'] as num).toInt()),
    );

Map<String, dynamic> _$VacationModelToJson(VacationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
      'note': instance.note,
      'status': VacationModel._statusToJson(instance.status),
    };
