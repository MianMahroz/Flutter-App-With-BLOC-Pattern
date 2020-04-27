import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {

  @override
  List<Object> get props {

  }
}


class AuthenticationUninitiated extends AuthenticationState{}
class AuthenticationAuthenticated extends AuthenticationState{}
class AuthenticationUnAuthenticated extends AuthenticationState{}
class AuthenticationLoading extends AuthenticationState{}
class AuthenticationError extends AuthenticationState{}

