import 'package:equatable/equatable.dart';
import 'package:flutterapp01/repositories/UserRepository.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}

class AppStared extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({this.token});

  @override
  List<Object> get props {
    return [token];
  }
}
class LoggedOut extends AuthenticationEvent {}