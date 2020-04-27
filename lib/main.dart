import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/authentication/authentication.dart';
import 'package:flutterapp01/bloc/employeeType/employeeType_bloc.dart';
import 'package:flutterapp01/bloc/login/login_bloc.dart';
import 'package:flutterapp01/common/loading_indicator.dart';
import 'package:flutterapp01/pages/mainPage.dart';
import 'package:flutterapp01/repositories/UserRepository.dart';
import 'package:flutterapp01/screen/bottom_navigation.dart';
import 'package:flutterapp01/screen/login_screen.dart';
import 'package:flutterapp01/screen/splash_screen.dart';
import 'package:flutterapp01/themes/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(create: (BuildContext context) {
          return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStared());
        }),
        BlocProvider<EmployeeTypeBloc>(
          create: (BuildContext context) => EmployeeTypeBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (BuildContext context) => LoginBloc(
              userRepository: userRepository,
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        ),
      ],
      child: MyApp(
        userRepository: userRepository,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  UserRepository userRepository;

  MyApp({this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce ',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.muliTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
//            return HomeScreen();
//            return BottomNavigation();
            return MainPage();
          }
          if (state is AuthenticationUnAuthenticated) {
            return LoginScreen(userRepository: userRepository);
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return SplashPage();
        },
      ),
    );
  }
}
