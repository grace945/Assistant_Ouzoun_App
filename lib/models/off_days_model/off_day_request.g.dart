// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'off_day_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffDayRequest _$OffDayRequestFromJson(Map<String, dynamic> json) =>
    OffDayRequest(
      from: json['from'] as String,
      to: json['to'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$OffDayRequestToJson(OffDayRequest instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'note': instance.note,
    };
