import 'package:firebase_app/features/authentication/domain/entities/entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserCredential> loginAuth(AuthEntity input);
  Future<UserCredential> register(AuthEntity input);
}
