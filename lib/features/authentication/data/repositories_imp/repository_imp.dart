import 'package:firebase_app/features/authentication/data/models/api_login_input.dart';
import 'package:firebase_app/features/authentication/domain/entities/entity.dart';
import 'package:firebase_app/features/authentication/domain/repositories/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImp extends AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Future<UserCredential> loginAuth(AuthEntity input) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: ApiLoginInput.fromInput(input).email ?? '',
          password: ApiLoginInput.fromInput(input).passWord ?? '');
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
      rethrow;
    }
  }

  @override
  Future<UserCredential> register(AuthEntity input) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: ApiLoginInput.fromInput(input).email ?? '',
          password: ApiLoginInput.fromInput(input).passWord ?? '');
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
      rethrow;
    }
  }
}
