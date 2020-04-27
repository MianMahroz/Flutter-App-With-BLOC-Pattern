import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/login/login_bloc.dart';
import 'package:flutterapp01/bloc/login/login_event.dart';
import 'package:flutterapp01/bloc/login/login_state.dart';
import 'package:flutterapp01/models/AuthenticateUserRequestDto.dart';

class LoginForm extends StatefulWidget {
  @override
  State createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  AuthenticateUserRequestDto _authenticateUserRequestDto =
      AuthenticateUserRequestDto();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      _authenticateUserRequestDto.requestFrom = "pos_web";
      BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        authenticateUserRequestDto: _authenticateUserRequestDto,
      ));
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                    decoration: InputDecoration(labelText: 'username'),
                    controller: _usernameController,
                    onChanged: (input) {
                      log(input);
                      _authenticateUserRequestDto.userId =
                          _usernameController.text;
                    }),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password'),
                  controller: _passwordController,
                  obscureText: true,
                  onChanged: (input) {
                    _authenticateUserRequestDto.userPassword =
                        _passwordController.text;
                  },
                ),
                RaisedButton(
                  onPressed:
                      state is! LoginLoading ? _onLoginButtonPressed : null,
                  child: Text('Login'),
                ),
                Container(
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : null,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
