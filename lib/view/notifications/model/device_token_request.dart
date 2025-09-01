// models/device_token_request.dart

import 'package:json_annotation/json_annotation.dart';

part 'device_token_request.g.dart';

@JsonSerializable()
class DeviceTokenRequest {
  final String deviceToken;

  DeviceTokenRequest({required this.deviceToken});

  factory DeviceTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$DeviceTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceTokenRequestToJson(this);
}
