import 'package:equatable/equatable.dart';

abstract class EmployeeTypeState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class EmployeeTypeInitiated extends EmployeeTypeState {
}

class EmployeeTypeSelected extends EmployeeTypeState {
  final String employeeType;

  EmployeeTypeSelected({this.employeeType});

  @override
  List<Object> get props {
    return [employeeType];
  }
}
