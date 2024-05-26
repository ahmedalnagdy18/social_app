import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_app/features/authentication/domain/entities/entity.dart';
import 'package:firebase_app/features/authentication/domain/usecases/login_usecase.dart';
import 'package:firebase_app/features/authentication/domain/usecases/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.risgesterUsecase, required this.loginUsecase})
      : super(AuthInitial());
  final LoginUsecase loginUsecase;
  final RisgesterUsecase risgesterUsecase;

  Future<void> addLogin(AuthEntity input) async {
    try {
      emit(LoginCubitLoading());
      // ignore: unused_local_variable
      final userCredential = await loginUsecase.call(input);
      emit(LoginCubitSucsess());
    } catch (e) {
      emit(LoginCubitFail());
    }
  }

  Future<void> addResgister(AuthEntity input) async {
    try {
      emit(ResgisterCubitLoading());
      // ignore: unused_local_variable
      final userCredential = await risgesterUsecase.call(input);
      emit(ResgisterCubitSucsess());
    } catch (e) {
      emit(ResgisterCubitFail());
    }
  }
}
