import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/app_theme.dart';
import 'package:flutterapp01/bloc/authentication/authentication.dart';
import 'package:flutterapp01/bloc/compareList/compareModelList_bloc.dart';
import 'package:flutterapp01/bloc/employeeType/employeeType_bloc.dart';
import 'package:flutterapp01/bloc/login/login_bloc.dart';
import 'package:flutterapp01/bloc/modelList_bloc/modelList_bloc.dart';
import 'package:flutterapp01/common/loading_indicator.dart';
import 'package:flutterapp01/navigation_home_screen.dart';
import 'package:flutterapp01/repositories/FilterModelListRepository.dart';
import 'package:flutterapp01/repositories/UserRepository.dart';
import 'package:flutterapp01/screen/bottom_navigation.dart';
import 'package:flutterapp01/screen/login_screen.dart';
import 'package:flutterapp01/screen/splash_screen.dart';
import 'dart:io';

import 'package:flutterapp01/utill/SimpleBlocDelegate.dart';

void main() async {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  final filterModelListRepository = FilterModelListRepository();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(
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
                  authenticationBloc:
                      BlocProvider.of<AuthenticationBloc>(context)),
            ),
            BlocProvider<ModelListBloc>(
              create: (BuildContext context) => ModelListBloc(
                filterModelListRepository: filterModelListRepository,
              ),
            ),
          ],
          child: MyApp(
            userRepository: userRepository,
          ),
        ),
      ));
}

class MyApp extends StatelessWidget {
  UserRepository userRepository;

  MyApp({this.userRepository});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'SELFPOS DEMO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationAuthenticated) {
//            return HomeScreen();
//            return BottomNavigation();
//            return NavigationHomeScreen();
            return BlocProvider(
              create: (context) => CompareModelListBloc(
                  modelListBloc: BlocProvider.of<ModelListBloc>(context)),
              child: NavigationHomeScreen(),
            );
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

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
