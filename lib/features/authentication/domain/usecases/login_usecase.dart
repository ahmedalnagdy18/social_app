import 'package:firebase_app/features/authentication/domain/entities/entity.dart';
import 'package:firebase_app/features/authentication/domain/repositories/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUsecase {
  AuthRepository repository;
  LoginUsecase({required this.repository});
  Future<UserCredential> call(AuthEntity input) async {
    return repository.loginAuth(input);
  }
}
