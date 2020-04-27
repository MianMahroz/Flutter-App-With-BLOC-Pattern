import 'package:equatable/equatable.dart';
import 'package:flutterapp01/models/AuthenticateUserResponseDto.dart';
import 'package:flutterapp01/repositories/UserRepository.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStared extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final AuthenticateUserResponseDto authenticateUserResponseDto;

  LoggedIn({this.authenticateUserResponseDto});

  @override
  List<Object> get props {
    return [authenticateUserResponseDto];
  }
}

class LoggedOut extends AuthenticationEvent {}
