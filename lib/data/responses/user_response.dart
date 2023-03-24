import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class PersonalResponse {
  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'name')
  String? name;

  PersonalResponse(this.email, this.name);

  factory PersonalResponse.fromJson(Map<String, dynamic> json) =>
      _$PersonalResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalResponseToJson(this);
}

@JsonSerializable()
class BusinessResponse {
  @JsonKey(name: 'company')
  String? company;

  @JsonKey(name: 'companyAddress')
  String? companyAddress;

  BusinessResponse(this.company, this.companyAddress);

  factory BusinessResponse.fromJson(Map<String, dynamic> json) =>
      _$BusinessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessResponseToJson(this);
}

@JsonSerializable()
class UserRegisterResponse {
  @JsonKey(name: 'personal')
  PersonalResponse? personal;

  @JsonKey(name: 'business')
  BusinessResponse? business;

  @JsonKey(name: 'token')
  String? token;

  UserRegisterResponse(this.personal, this.business, this.token);

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterResponseToJson(this);
}

// flutter pub run build_runner build --delete-conflicting-outputs
