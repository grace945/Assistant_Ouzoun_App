import 'package:json_annotation/json_annotation.dart';

part 'off_day_request.g.dart';

@JsonSerializable()
class OffDayRequest {
  final String from;
  final String to;
  final String note;

  OffDayRequest({
    required this.from,
    required this.to,
    required this.note,
  });

  factory OffDayRequest.fromJson(Map<String, dynamic> json) => _$OffDayRequestFromJson(json);
  Map<String, dynamic> toJson() => _$OffDayRequestToJson(this);
}
