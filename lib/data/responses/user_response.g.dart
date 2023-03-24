// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalResponse _$PersonalResponseFromJson(Map<String, dynamic> json) =>
    PersonalResponse(
      json['email'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$PersonalResponseToJson(PersonalResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
    };

BusinessResponse _$BusinessResponseFromJson(Map<String, dynamic> json) =>
    BusinessResponse(
      json['company'] as String?,
      json['companyAddress'] as String?,
    );

Map<String, dynamic> _$BusinessResponseToJson(BusinessResponse instance) =>
    <String, dynamic>{
      'company': instance.company,
      'companyAddress': instance.companyAddress,
    };

UserRegisterResponse _$UserRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    UserRegisterResponse(
      json['personal'] == null
          ? null
          : PersonalResponse.fromJson(json['personal'] as Map<String, dynamic>),
      json['business'] == null
          ? null
          : BusinessResponse.fromJson(json['business'] as Map<String, dynamic>),
      json['token'] as String?,
    );

Map<String, dynamic> _$UserRegisterResponseToJson(
        UserRegisterResponse instance) =>
    <String, dynamic>{
      'personal': instance.personal,
      'business': instance.business,
      'token': instance.token,
    };
