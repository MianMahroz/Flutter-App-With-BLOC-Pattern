import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:flutterapp01/bloc/bottom_navigation/bottom_navigation_event.dart';
import 'package:flutterapp01/bloc/bottom_navigation/bottom_navigation_state.dart';
import 'package:flutterapp01/screen/employeeType_screen.dart';
import 'package:flutterapp01/screen/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  State createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  BottomNavigationBloc _bottomNavigationBloc;
  final tabs = [
    Center(
      child: HomeScreen(),
    ),
    Center(
      child: EmployeeTypeScreen(),
    ),
    Center(
      child: Text('Model List Screen'),
    )
  ];

  Scaffold buildPage(int currentIndex, String title) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SelfPos Flutter Demo'),
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Employee Type'),
              backgroundColor: Colors.green),
        ],
        onTap: (index) {
          if (index == 0) _bottomNavigationBloc.add(HomePressed());
          if (index == 1) _bottomNavigationBloc.add(EmployeeTypePressed());
          if (index == 2) _bottomNavigationBloc.add(ModelListPressed());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      bloc: _bottomNavigationBloc,
      builder: (context, state) {
        if (state is HomeLoaded) return buildPage(state.index, state.title);
        if (state is EmployeeTypeLoaded)
          return buildPage(state.index, state.title);
        if (state is ModelListLoaded)
          return buildPage(state.index, state.title);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _bottomNavigationBloc = BottomNavigationBloc();
  }
}
