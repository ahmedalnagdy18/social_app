part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class LoginCubitLoading extends AuthState {}

class LoginCubitSucsess extends AuthState {}

class LoginCubitFail extends AuthState {}

class ResgisterCubitLoading extends AuthState {}

class ResgisterCubitSucsess extends AuthState {}

class ResgisterCubitFail extends AuthState {}
