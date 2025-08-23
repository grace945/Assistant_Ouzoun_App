import 'package:json_annotation/json_annotation.dart';
part 'change_status_model.g.dart';
@JsonSerializable()
class ChangeStatueModel {
  int ProcedureId;
  int newStatus;

  ChangeStatueModel(this.ProcedureId, this.newStatus);
  factory ChangeStatueModel.fromJson(Map<String, dynamic> json) => _$ChangeStatueModelFromJson(json);


  Map<String, dynamic> toJson() => _$ChangeStatueModelToJson(this);
}