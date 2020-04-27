import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/authentication/authentication.dart';
import 'package:flutterapp01/bloc/login/login_event.dart';
import 'package:flutterapp01/bloc/login/login_state.dart';
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
        final token =  userRepository.authenticateUser(
            authenticateUserRequestDto: event.authenticateUserRequestDto);
//        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitiated();
      } catch (error) {
        yield LoginFailure(error: error);
      }
    }
  }
}
