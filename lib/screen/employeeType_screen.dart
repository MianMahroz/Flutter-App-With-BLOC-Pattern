import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/employeeType/employeeType_bloc.dart';
import 'package:flutterapp01/bloc/employeeType/employeeType_event.dart';
import 'package:flutterapp01/screen/employeeType_form.dart';

class EmployeeTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[EmployeeTypeForm()],
    );
  }
}
