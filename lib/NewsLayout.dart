// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Modules/serarchScreen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'Modules/Business.dart';
import 'Shared/Components/components.dart';
import 'Shared/Cubit/Cubit.dart';
import 'Shared/Cubit/State.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp, StateApp>(
        listener: (context, state) {},
        builder: (context, state) {
          var control = CubitApp.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.brightness_2,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    control.changeDarkMode();
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: control.screen[control.currentIndex]),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: TextStyle(color: Colors.green),
              currentIndex: control.currentIndex,
              items: control.bottomNavigationBarItem,
              onTap: ((value) => control.CurrentIndexBottomNavigation(value)),
            ),
          );
        });
  }
}
