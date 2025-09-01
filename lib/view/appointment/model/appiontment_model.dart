import 'package:json_annotation/json_annotation.dart';
import 'enum_status.dart';

part 'appiontment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AppiontmentModel {
  final int id;
  final String doctorId;
  @JsonKey(name: "numberOfAsisstants")
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

  AppiontmentModel({
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

  factory AppiontmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppiontmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppiontmentModelToJson(this);
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
      case 5:
        return EnumProcedureStatus.Cancelled;
      default:
        throw Exception("Unknown status value: $value"); // 👈 Exception واضح
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
      case EnumProcedureStatus.Cancelled:
        return 5;
    }
  }

}

enum EnumProcedureStatus { REQUEST_SENT, IN_PROGRESS, DONE, DECLINED ,Cancelled}

@JsonSerializable(explicitToJson: true)
class Doctor {
  final String? id;
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? role;
  final Clinic? clinic;
  final int? rate;

  Doctor({
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.role,
    this.clinic,
    this.rate,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class Clinic {
  final int? id;
  final String? name;
  final String? address;
  final double? longtitude;
  final double? latitude;

  Clinic({this.id, this.name, this.address, this.longtitude, this.latitude});

  factory Clinic.fromJson(Map<String, dynamic> json) => _$ClinicFromJson(json);
  Map<String, dynamic> toJson() => _$ClinicToJson(this);
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

@JsonSerializable(explicitToJson: true)
class Assistant {
  final String? id;
  final String? userName;
  final String? email;
  final String? phoneNumber;
  final String? role;
  final Clinic? clinic;
  final int? rate;

  Assistant({
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.role,
    this.clinic,
    this.rate,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) =>
      _$AssistantFromJson(json);

  Map<String, dynamic> toJson() => _$AssistantToJson(this);
}
