
import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {

  @override
  List<Object> get props {
     return [];
  }
}

class HomePressed extends BottomNavigationEvent{}
class EmployeeTypePressed extends BottomNavigationEvent{}
class ModelListPressed extends BottomNavigationEvent{}
