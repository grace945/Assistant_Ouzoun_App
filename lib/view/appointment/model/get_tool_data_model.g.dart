// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tool_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentToolModel _$AppointmentToolModelFromJson(
  Map<String, dynamic> json,
) => AppointmentToolModel(
  id: (json['id'] as num?)?.toInt(),
  doctorId: json['doctorId'] as String?,
  categoryId: (json['categoryId'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  doctor: json['doctor'] == null
      ? null
      : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
  surgicalKits: (json['surgicalKits'] as List<dynamic>?)
      ?.map((e) => SurgicalKit.fromJson(e as Map<String, dynamic>))
      .toList(),
  requiredTools: (json['requiredTools'] as List<dynamic>?)
      ?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
      .toList(),
  implantKits: (json['implantKits'] as List<dynamic>?)
      ?.map((e) => ImplantKit.fromJson(e as Map<String, dynamic>))
      .toList(),
  assistants: (json['assistants'] as List<dynamic>?)
      ?.map((e) => Assistant.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AppointmentToolModelToJson(
  AppointmentToolModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'doctorId': instance.doctorId,
  'categoryId': instance.categoryId,
  'status': instance.status,
  'date': instance.date?.toIso8601String(),
  'doctor': instance.doctor?.toJson(),
  'surgicalKits': instance.surgicalKits?.map((e) => e.toJson()).toList(),
  'requiredTools': instance.requiredTools?.map((e) => e.toJson()).toList(),
  'implantKits': instance.implantKits?.map((e) => e.toJson()).toList(),
  'assistants': instance.assistants?.map((e) => e.toJson()).toList(),
};

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
  id: json['id'] as String?,
  userName: json['userName'] as String?,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  role: json['role'] as String?,
  clinic: json['clinic'] == null
      ? null
      : Clinic.fromJson(json['clinic'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'role': instance.role,
  'clinic': instance.clinic,
};

Clinic _$ClinicFromJson(Map<String, dynamic> json) => Clinic(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  address: json['address'] as String?,
  longtitude: (json['longtitude'] as num?)?.toDouble(),
  latitude: (json['latitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ClinicToJson(Clinic instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'longtitude': instance.longtitude,
  'latitude': instance.latitude,
};

SurgicalKit _$SurgicalKitFromJson(Map<String, dynamic> json) => SurgicalKit(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  isMainKit: json['isMainKit'] as bool?,
  imagePath: json['imagePath'] as String?,
  implants: (json['implants'] as List<dynamic>?)
      ?.map((e) => Implant.fromJson(e as Map<String, dynamic>))
      .toList(),
  tools: (json['tools'] as List<dynamic>?)
      ?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SurgicalKitToJson(SurgicalKit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isMainKit': instance.isMainKit,
      'implants': instance.implants?.map((e) => e.toJson()).toList(),
      'tools': instance.tools?.map((e) => e.toJson()).toList(),
      'imagePath': instance.imagePath,
    };

Implant _$ImplantFromJson(Map<String, dynamic> json) => Implant(
  id: (json['id'] as num?)?.toInt(),
  radius: (json['radius'] as num?)?.toDouble(),
  width: (json['width'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num?)?.toInt(),
  brand: json['brand'] as String?,
  description: json['description'] as String?,
  imagePath: json['imagePath'] as String?,
  kitId: (json['kitId'] as num?)?.toInt(),
);

Map<String, dynamic> _$ImplantToJson(Implant instance) => <String, dynamic>{
  'id': instance.id,
  'radius': instance.radius,
  'width': instance.width,
  'height': instance.height,
  'quantity': instance.quantity,
  'brand': instance.brand,
  'description': instance.description,
  'imagePath': instance.imagePath,
  'kitId': instance.kitId,
};

Tool _$ToolFromJson(Map<String, dynamic> json) => Tool(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  width: (json['width'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
  thickness: (json['thickness'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num?)?.toInt(),
  kitId: (json['kitId'] as num?)?.toInt(),
  categoryId: (json['categoryId'] as num?)?.toInt(),
  imagePath: json['imagePath'] as String?,
);

Map<String, dynamic> _$ToolToJson(Tool instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'width': instance.width,
  'height': instance.height,
  'thickness': instance.thickness,
  'quantity': instance.quantity,
  'kitId': instance.kitId,
  'categoryId': instance.categoryId,
  'imagePath': instance.imagePath,
};

ImplantKit _$ImplantKitFromJson(Map<String, dynamic> json) => ImplantKit(
  implant: json['implant'] == null
      ? null
      : Implant.fromJson(json['implant'] as Map<String, dynamic>),
  toolsWithImplant: (json['toolsWithImplant'] as List<dynamic>?)
      ?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ImplantKitToJson(ImplantKit instance) =>
    <String, dynamic>{
      'implant': instance.implant?.toJson(),
      'toolsWithImplant': instance.toolsWithImplant
          ?.map((e) => e.toJson())
          .toList(),
    };

Assistant _$AssistantFromJson(Map<String, dynamic> json) => Assistant(
  id: json['id'] as String?,
  userName: json['userName'] as String?,
  email: json['email'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  role: json['role'] as String?,
  clinic: json['clinic'] == null
      ? null
      : Clinic.fromJson(json['clinic'] as Map<String, dynamic>),
  profileImagePath: json['profileImagePath'] as String?,
);

Map<String, dynamic> _$AssistantToJson(Assistant instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'role': instance.role,
  'clinic': instance.clinic,
  'profileImagePath': instance.profileImagePath,
};
