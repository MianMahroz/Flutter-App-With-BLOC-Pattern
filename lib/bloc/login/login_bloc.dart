import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/authentication/authentication.dart';
import 'package:flutterapp01/bloc/login/login_event.dart';
import 'package:flutterapp01/bloc/login/login_state.dart';
import 'package:flutterapp01/models/AuthenticateUserResponseDto.dart';
import 'package:flutterapp01/repositories/UserRepository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  AuthenticationBloc authenticationBloc;

  LoginBloc({this.userRepository, this.authenticationBloc});

  @override
  LoginState get initialState {
    return LoginInitiated();
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
//        final authenticateUserResponseDto =
//            await userRepository.authenticateUser(
//                authenticateUserRequestDto: event.authenticateUserRequestDto);
        yield LoginInitiated();
        authenticationBloc.add(LoggedIn(
            authenticateUserResponseDto: AuthenticateUserResponseDto()));
      } catch (error) {
        yield LoginFailure(error: error);
      }
    }
  }
}
