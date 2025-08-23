import 'package:json_annotation/json_annotation.dart';

part 'get_tool_data_model.g.dart';



@JsonSerializable(explicitToJson: true)
class AppointmentModel {
  int? id;
  String? doctorId;
  int? categoryId;
  int? status;
  DateTime? date;
  Doctor? doctor;
  List<SurgicalKit>? surgicalKits;
  List<Tool>? requiredTools;
  List<ImplantKit>? implantKits;
  List<Assistant>? assistants;

  AppointmentModel({
    this.id,
    this.doctorId,
    this.categoryId,
    this.status,
    this.date,
    this.doctor,
    List<SurgicalKit>? surgicalKits,
    List<Tool>? requiredTools,
    List<ImplantKit>? implantKits,
    List<Assistant>? assistants,
  })  : surgicalKits = surgicalKits ?? [],
        requiredTools = requiredTools ?? [],
        implantKits = implantKits ?? [],
        assistants = assistants ?? [];

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}

@JsonSerializable()
class Doctor {
  String? id;
  String? userName;
  String? email;
  String? phoneNumber;
  String? role;
  Clinic? clinic;

  Doctor({
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.role,
    this.clinic,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class Clinic {
  int? id;
  String? name;
  String? address;
  double? longtitude;
  double? latitude;

  Clinic({
    this.id,
    this.name,
    this.address,
    this.longtitude,
    this.latitude,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) => _$ClinicFromJson(json);
  Map<String, dynamic> toJson() => _$ClinicToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SurgicalKit {
  int? id;
  String? name;
  bool? isMainKit;
  List<Implant>? implants;
  List<Tool>? tools;

  SurgicalKit({
    this.id,
    this.name,
    this.isMainKit,
    List<Implant>? implants,
    List<Tool>? tools,
  })  : implants = implants ?? [],
        tools = tools ?? [];

  factory SurgicalKit.fromJson(Map<String, dynamic> json) =>
      _$SurgicalKitFromJson(json);
  Map<String, dynamic> toJson() => _$SurgicalKitToJson(this);
}

@JsonSerializable()
class Implant {
  int? id;
  double? radius;
  double? width;
  double? height;
  int? quantity;
  String? brand;
  String? description;
  String? imagePath;
  int? kitId;

  Implant({
    this.id,
    this.radius,
    this.width,
    this.height,
    this.quantity,
    this.brand,
    this.description,
    this.imagePath,
    this.kitId,
  });

  factory Implant.fromJson(Map<String, dynamic> json) =>
      _$ImplantFromJson(json);
  Map<String, dynamic> toJson() => _$ImplantToJson(this);
}

@JsonSerializable()
class Tool {
  int? id;
  String? name;
  double? width;
  double? height;
  double? thickness;
  int? quantity;
  int? kitId;
  int? categoryId;

  Tool({
    this.id,
    this.name,
    this.width,
    this.height,
    this.thickness,
    this.quantity,
    this.kitId,
    this.categoryId,
  });

  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);
  Map<String, dynamic> toJson() => _$ToolToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImplantKit {
  Implant? implant;
  List<Tool>? toolsWithImplant;

  ImplantKit({
    this.implant,
    List<Tool>? toolsWithImplant,
  }) : toolsWithImplant = toolsWithImplant ?? [];

  factory ImplantKit.fromJson(Map<String, dynamic> json) =>
      _$ImplantKitFromJson(json);
  Map<String, dynamic> toJson() => _$ImplantKitToJson(this);
}

@JsonSerializable()
class Assistant {
  String? id;
  String? userName;
  String? email;
  String? phoneNumber;
  String? role;
  Clinic? clinic;

  Assistant({
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.role,
    this.clinic,
  });

  factory Assistant.fromJson(Map<String, dynamic> json) =>
      _$AssistantFromJson(json);
  Map<String, dynamic> toJson() => _$AssistantToJson(this);
}
