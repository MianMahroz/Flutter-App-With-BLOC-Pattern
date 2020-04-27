import 'package:equatable/equatable.dart';

abstract class EmployeeTypeEvent extends Equatable {

  @override
  List<Object> get props {
      return [];
  }
}

class EmployeeTypeButtonPressed extends EmployeeTypeEvent {
  final String employeeType;
  EmployeeTypeButtonPressed({this.employeeType});
  @override
  List<Object> get props {
     return [employeeType];
  }

}