// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  id: (json['id'] as num).toInt(),
  note: json['note'] as String?,
  rate: (json['rate'] as num).toInt(),
  doctorId: json['doctorId'] as String,
  doctorName: json['doctorName'] as String,
  assistantId: json['assistantId'] as String,
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'note': instance.note,
      'rate': instance.rate,
      'doctorId': instance.doctorId,
      'doctorName': instance.doctorName,
      'assistantId': instance.assistantId,
    };
