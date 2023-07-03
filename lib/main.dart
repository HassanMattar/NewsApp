// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Dio/DioHelper.dart';
import 'package:flutter_application_1/NewsLayout.dart';
import 'package:flutter_application_1/Shared/Cubit/Cubit.dart';
import 'package:flutter_application_1/Shared/Cubit/State.dart';
import 'package:flutter_application_1/Shared/Shared_Preferences/shared_Preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Shared/Cubit/CubitObserver.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await Shared_Preferences.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitApp()
        ..Getsport()
        ..changeDarkModeByPreferances(),
      child: BlocConsumer<CubitApp, StateApp>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              textTheme: TextTheme(
                   bodyText1: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis)),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                backgroundColor: Colors.white,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
              )),
          darkTheme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(color: Colors.white, fontSize: 20)),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                backgroundColor: Colors.black12,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.dark),
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.black12)),
          themeMode:
              CubitApp.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: NewsLayout(),
        ),
      ),
    );
  }
}
