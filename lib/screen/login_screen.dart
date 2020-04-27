import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/authentication/authentication.dart';
import 'package:flutterapp01/bloc/login/login_bloc.dart';
import 'package:flutterapp01/repositories/UserRepository.dart';
import 'package:flutterapp01/screen/login_form.dart';

class LoginScreen extends StatelessWidget {
  UserRepository userRepository;

  LoginScreen({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: LoginForm()
//        BlocProvider(
//          create: (context) {
//            return LoginBloc(
//                userRepository: userRepository,
//                authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)
//            );
//          },
//          child: LoginForm(),
//        )
        );
  }
}
