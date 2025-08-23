import 'package:assistantapp/models/off_days_model/vacation-status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'off_days_model.g.dart';

@JsonSerializable()
class VacationModel {
  final int id;
  final DateTime from;
  final DateTime to;
  final String note;

  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  final VacationStatus status;

  VacationModel({
    required this.id,
    required this.from,
    required this.to,
    required this.note,
    required this.status,
  });

  factory VacationModel.fromJson(Map<String, dynamic> json) =>
      _$VacationModelFromJson(json);

  Map<String, dynamic> toJson() => _$VacationModelToJson(this);


  static VacationStatus _statusFromJson(int value) {
    switch (value) {
      case 1:
        return VacationStatus.pending;
      case 2:
        return VacationStatus.Accepted;
      case 3:
        return VacationStatus.rejected;
      default:
        throw Exception("Unknown status value: $value");
    }
  }


  static int _statusToJson(VacationStatus status) {
    switch (status) {
      case VacationStatus.pending:
        return 1;
      case VacationStatus.Accepted:
        return 2;
      case VacationStatus.rejected:
        return 3;
    }
  }
}
