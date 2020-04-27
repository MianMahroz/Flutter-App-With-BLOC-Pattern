import 'package:equatable/equatable.dart';
import 'package:flutterapp01/models/AuthenticateUserResponseDto.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props {}
}

class AuthenticationUninitiated extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final AuthenticateUserResponseDto authenticateUserResponseDto;

  AuthenticationAuthenticated({this.authenticateUserResponseDto});
}

class AuthenticationUnAuthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {}
