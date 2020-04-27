import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/bottom_navigation/bottom_navigation_event.dart';
import 'package:flutterapp01/bloc/bottom_navigation/bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  @override
  BottomNavigationState get initialState {
    return HomeLoaded();
  }

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is HomePressed) yield HomeLoaded();
    if (event is EmployeeTypePressed) yield EmployeeTypeLoaded();
    if (event is ModelListPressed) yield ModelListLoaded();
  }
}
