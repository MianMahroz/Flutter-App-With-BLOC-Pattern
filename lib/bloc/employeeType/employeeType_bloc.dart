import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/employeeType/employeeType_event.dart';
import 'package:flutterapp01/bloc/employeeType/employeeType_state.dart';
import 'dart:async';

class EmployeeTypeBloc extends Bloc<EmployeeTypeEvent, EmployeeTypeState> {

  @override
  EmployeeTypeState get initialState {
    return EmployeeTypeInitiated();
  }

  @override
  Stream<EmployeeTypeState> mapEventToState(EmployeeTypeEvent event) async* {
    if (event is EmployeeTypeButtonPressed) {
      yield EmployeeTypeSelected(employeeType: event.employeeType);
    }
  }
}
