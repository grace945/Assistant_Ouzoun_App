// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeStatueModel _$ChangeStatueModelFromJson(Map<String, dynamic> json) =>
    ChangeStatueModel(
      (json['ProcedureId'] as num).toInt(),
      (json['newStatus'] as num).toInt(),
    );

Map<String, dynamic> _$ChangeStatueModelToJson(ChangeStatueModel instance) =>
    <String, dynamic>{
      'ProcedureId': instance.ProcedureId,
      'newStatus': instance.newStatus,
    };
