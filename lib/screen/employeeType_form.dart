import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/employeeType/employeeType_bloc.dart';
import 'package:flutterapp01/bloc/employeeType/employeeType_event.dart';
import 'package:flutterapp01/bloc/employeeType/employeeType_state.dart';

class EmployeeTypeForm extends StatefulWidget {
  EmployeeTypeForm({Key key}) : super(key: key);

  @override
  State<EmployeeTypeForm> createState() {
    return _EmployeeTypeFormState();
  }
}

class _EmployeeTypeFormState extends State<EmployeeTypeForm> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmployeeTypeBloc, EmployeeTypeState>(
        builder: (context, state) {
      return Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                BlocProvider.of<EmployeeTypeBloc>(context)
                    .add(EmployeeTypeButtonPressed(employeeType: 'INDIVIDUAL'));
              },
              child: Text('Individual'),
            ),
            RaisedButton(
              onPressed: () {
                BlocProvider.of<EmployeeTypeBloc>(context)
                    .add(EmployeeTypeButtonPressed(employeeType: 'COMPANY'));
              },
              child: Text('Company'),
            ),
            getEmployTypeText(state),
          ],
        ),
      );
    });
  }

  Widget getEmployTypeText(EmployeeTypeState state) {
    return state is EmployeeTypeSelected
        ? Container(
            child: Column(
              children: <Widget>[Text(state.employeeType)],
            ),
          )
        : Text('Not Selected');
  }
}
