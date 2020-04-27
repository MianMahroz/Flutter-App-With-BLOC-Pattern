import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/authentication/authentication_event.dart';
import 'package:flutterapp01/bloc/authentication/authentication_state.dart';
import 'package:flutterapp01/repositories/UserRepository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  UserRepository userRepository;

  AuthenticationBloc({this.userRepository});

  @override
  AuthenticationState get initialState {
    return AuthenticationUninitiated();
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStared) {
//      bool hasToken = await userRepository.hasToken();
//      if (hasToken)
//        yield AuthenticationAuthenticated();
//      else
        yield AuthenticationUnAuthenticated();
    }
    if (event is LoggedIn) {
      yield AuthenticationAuthenticated(
          authenticateUserResponseDto: event.authenticateUserResponseDto);
    }
    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnAuthenticated();
    }
  }
}
