import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable{

}

class HomeLoaded extends BottomNavigationState{
  final int index=0;
  final String title='Home';

  @override
  List<Object> get props {
    return [index,title];
  }
}
class EmployeeTypeLoaded extends BottomNavigationState{
  final int index=1;
  final String title='Employee Type';

  @override
  List<Object> get props {
    return [index,title];
  }
}
class ModelListLoaded extends BottomNavigationState{
  final int index=2;
  final String title='Model List';

  @override
  List<Object> get props {
    return [index,title];
  }
}


