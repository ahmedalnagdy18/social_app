// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_login_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiLoginInput _$ApiLoginInputFromJson(Map<String, dynamic> json) =>
    ApiLoginInput(
      email: json['email'] as String?,
      passWord: json['passWord'] as String?,
    );

Map<String, dynamic> _$ApiLoginInputToJson(ApiLoginInput instance) =>
    <String, dynamic>{
      'email': instance.email,
      'passWord': instance.passWord,
    };
