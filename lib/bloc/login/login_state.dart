import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{

  @override
  List<Object> get props {

  }
}

class LoginInitiated extends LoginState {}
class LoginLoading extends LoginState {}
class LoginFailure extends LoginState {
  final String error;
  LoginFailure({this.error});

  @override
  List<Object> get props {
     return [error];
  }

  @override
  String toString() {
       return "Login Failure {error: $error}";
  }
}

