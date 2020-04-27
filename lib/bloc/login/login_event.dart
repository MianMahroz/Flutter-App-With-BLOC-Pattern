import 'package:equatable/equatable.dart';
import 'package:flutterapp01/models/AuthenticateUserRequestDto.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  AuthenticateUserRequestDto authenticateUserRequestDto;

  LoginButtonPressed({this.authenticateUserRequestDto});

  @override
  List<Object> get props {
    return [authenticateUserRequestDto];
  }

  @override
  String toString() {
    return "Login Button Pressed {dto:$authenticateUserRequestDto}";
  }
}
