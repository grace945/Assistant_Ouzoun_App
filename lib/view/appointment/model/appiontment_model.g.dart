// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appiontment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppiontmentModel _$AppiontmentModelFromJson(Map<String, dynamic> json) =>
    AppiontmentModel(
      id: (json['id'] as num).toInt(),
      doctorId: json['doctorId'] as String,
      numberOfAssistants: (json['numberOfAsisstants'] as num?)?.toInt(),
      assistantIds: (json['assistantIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      categoryId: (json['categoryId'] as num).toInt(),
      status: AppiontmentModel._statusFromJson((json['status'] as num).toInt()),
      date: DateTime.parse(json['date'] as String),
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      tools: (json['tools'] as List<dynamic>?)
          ?.map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
      kits: (json['kits'] as List<dynamic>?)
          ?.map((e) => Kit.fromJson(e as Map<String, dynamic>))
          .toList(),
      implants: (json['implants'] as List<dynamic>?)
          ?.map((e) => Implant.fromJson(e as Map<String, dynamic>))
          .toList(),
      assistants: (json['assistants'] as List<dynamic>?)
          ?.map((e) => Assistant.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppiontmentModelToJson(AppiontmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorId': instance.doctorId,
      'numberOfAsisstants': instance.numberOfAssistants,
      'assistantIds': instance.assistantIds,
      'categoryId': instance.categoryId,
      'status': AppiontmentModel._statusToJson(instance.status),
      'date': instance.date.toIso8601String(),
      'doctor': instance.doctor?.toJson(),
      'tools': instance.tools?.map((e) => e.toJson()).toList(),
      'kits': instance.kits?.map((e) => e.toJson()).toList(),
      'implants': instance.implants?.map((e) => e.toJson()).toList(),
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
  rate: (json['rate'] as num?)?.toInt(),
);

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'role': instance.role,
  'clinic': instance.clinic?.toJson(),
  'rate': instance.rate,
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

Tool _$ToolFromJson(Map<String, dynamic> json) =>
    Tool(toolName: json['toolName'] as String?);

Map<String, dynamic> _$ToolToJson(Tool instance) => <String, dynamic>{
  'toolName': instance.toolName,
};

Kit _$KitFromJson(Map<String, dynamic> json) =>
    Kit(kitName: json['kitName'] as String?);

Map<String, dynamic> _$KitToJson(Kit instance) => <String, dynamic>{
  'kitName': instance.kitName,
};

Implant _$ImplantFromJson(Map<String, dynamic> json) =>
    Implant(implantName: json['implantName'] as String?);

Map<String, dynamic> _$ImplantToJson(Implant instance) => <String, dynamic>{
  'implantName': instance.implantName,
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
  rate: (json['rate'] as num?)?.toInt(),
);

Map<String, dynamic> _$AssistantToJson(Assistant instance) => <String, dynamic>{
  'id': instance.id,
  'userName': instance.userName,
  'email': instance.email,
  'phoneNumber': instance.phoneNumber,
  'role': instance.role,
  'clinic': instance.clinic?.toJson(),
  'rate': instance.rate,
};
