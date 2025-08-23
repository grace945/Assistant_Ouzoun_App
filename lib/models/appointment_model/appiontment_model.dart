import 'package:json_annotation/json_annotation.dart';
import 'enum_status.dart';

part 'appiontment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ScheduleRequestModel {
  final int id;
  final String doctorId;
  final int? numberOfAssistants;
  final List<String>? assistantIds;
  final int categoryId;

  @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
  final EnumProcedureStatus status;

  final DateTime date;

  final Doctor? doctor;
  final List<Tool>? tools;
  final List<Kit>? kits;
  final List<Implant>? implants;
  final List<Assistant>? assistants;

  ScheduleRequestModel({
    required this.id,
    required this.doctorId,
    this.numberOfAssistants,
    this.assistantIds,
    required this.categoryId,
    required this.status,
    required this.date,
    this.doctor,
    this.tools,
    this.kits,
    this.implants,
    this.assistants,
  });

  factory ScheduleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ScheduleRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleRequestModelToJson(this);

  static EnumProcedureStatus _statusFromJson(int value) {
    switch (value) {
      case 1:
        return EnumProcedureStatus.REQUEST_SENT;
      case 2:
        return EnumProcedureStatus.IN_PROGRESS;
      case 3:
        return EnumProcedureStatus.DONE;
      case 4:
        return EnumProcedureStatus.DECLINED;

      default:
        throw Exception("Unknown status value: $value");
    }
  }

  static int _statusToJson(EnumProcedureStatus status) {
    switch (status) {
      case EnumProcedureStatus.REQUEST_SENT:
        return 1;
      case EnumProcedureStatus.IN_PROGRESS:
        return 2;
      case EnumProcedureStatus.DONE:
        return 3;
      case EnumProcedureStatus.DECLINED:
        return 4;

    }
  }
}

enum EnumProcedureStatus {
  REQUEST_SENT,
  IN_PROGRESS,
  DONE,
  DECLINED,
}

@JsonSerializable()
class Doctor {
  final String? userName;

  Doctor({this.userName});

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class Tool {
  final String? toolName;

  Tool({this.toolName});

  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);
  Map<String, dynamic> toJson() => _$ToolToJson(this);
}

@JsonSerializable()
class Kit {
  final String? kitName;

  Kit({this.kitName});

  factory Kit.fromJson(Map<String, dynamic> json) => _$KitFromJson(json);
  Map<String, dynamic> toJson() => _$KitToJson(this);
}

@JsonSerializable()
class Implant {
  final String? implantName;

  Implant({this.implantName});

  factory Implant.fromJson(Map<String, dynamic> json) =>
      _$ImplantFromJson(json);
  Map<String, dynamic> toJson() => _$ImplantToJson(this);
}

@JsonSerializable()
class Assistant {
  final String? userName;

  Assistant({this.userName});

  factory Assistant.fromJson(Map<String, dynamic> json) =>
      _$AssistantFromJson(json);
  Map<String, dynamic> toJson() => _$AssistantToJson(this);
}
