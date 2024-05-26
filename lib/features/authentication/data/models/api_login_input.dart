import 'package:firebase_app/features/authentication/domain/entities/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_login_input.g.dart';

@JsonSerializable()
class ApiLoginInput {
  final String? email;
  final String? passWord;

  ApiLoginInput({this.email, this.passWord});

  factory ApiLoginInput.fromJson(Map<String, dynamic> json) =>
      _$ApiLoginInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiLoginInputToJson(this);
  factory ApiLoginInput.fromInput(AuthEntity input) {
    return ApiLoginInput(email: input.email, passWord: input.password);
  }
}
