import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/authentication/authentication.dart';
import 'package:flutterapp01/screen/bottom_navigation.dart';
import 'package:flutterapp01/screen/employeeType_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Home COntent'),
    );
  }
}
