import 'package:flutter/material.dart';
import 'package:flutter_application_1/Modules/Business.dart';
import 'package:flutter_application_1/Modules/Science.dart';
import 'package:flutter_application_1/Modules/SportNews.dart';
import 'package:flutter_application_1/Shared/Shared_Preferences/shared_Preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Dio/DioHelper.dart';
import '../../Modules/Seeting.dart';
import 'State.dart';

class CubitApp extends Cubit<StateApp> {
  CubitApp() : super(InitialState());
  static CubitApp get(context) => BlocProvider.of<CubitApp>(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_bar_outlined), label: "Sport"),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: "Science"),
    BottomNavigationBarItem(
        icon: Icon(Icons.business_outlined), label: "business"),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings_ethernet), label: "Setting"),
  ];
  List screen = [SportNews(), ScienceNews(), BusinessNews(), SeetingScreen()];
  void CurrentIndexBottomNavigation(currentIndex) {
    print(currentIndex);
    if (currentIndex == 1 && science!.isEmpty) {
      GetScience();
    }
    if (currentIndex == 0 && sport!.isEmpty) {
      Getsport();
    }
    if (currentIndex == 2 && business!.isEmpty) {
      GetBusiness();
    }
    this.currentIndex = currentIndex;
    emit(CurrentIndexBottomNavigationState());
  }

  List<dynamic>? business = [];
  List<dynamic>? science = [];
  List<dynamic>? sport = [];

  void GetBusiness() async {
    emit(LoadeBusinessNews());

    await DioHelper.getData("v2/top-headlines", {
      "country": "eg",
      "category": "business",
      "apiKey": "5f78b1bdfdd84eb08d4ced0d1cd9372b",
    }).then((value) {
      business = value.data['articles'];
      print(business.toString());
      emit(LoadeBusinessNewsSucces());
    }).catchError((onError) {
      print(onError);
      emit(LoadeBusinessNewsError(onError));
    });
  }

  void GetScience() {
    emit(LoadeScienceNews());
    DioHelper.getData("v2/top-headlines", {
      "country": "eg",
      "category": "science",
      "apiKey": "5f78b1bdfdd84eb08d4ced0d1cd9372b",
    }).then((value) {
      emit(LoadeSciencNewsSucces());

      science = value.data['articles'];
    }).catchError((onError) {
      emit(LoadeSciencNewsError(onError));
    });
  }

  void Getsport() {
    emit(LoadeSportNews());
    DioHelper.getData("v2/top-headlines", {
      "country": "eg",
      "category": "sport",
      "apiKey": "5f78b1bdfdd84eb08d4ced0d1cd9372b",
    }).then((value) {
      sport = value.data['articles'];

      emit(LoadeSportNewsSucces());
    }).catchError((onError) {
      emit(LoadeSportNewsError(onError));
      print(onError.toString());
    });
  }

  bool isDark = false;
  void changeDarkModeByPreferances() async {
    if (Shared_Preferences.getBoolean("isDark") != null) {
      this.isDark = await Shared_Preferences.getBoolean("isDark")!;
      print(isDark);
      emit(ChangeDarkModeByPreferancesState());
    } else {
      print(isDark);

      emit(ChangeDarkModeByPreferancesStateNot());
    }
  }

  void changeDarkMode() async {
    this.isDark = !isDark;
    await Shared_Preferences.setBoolean("isDark", this.isDark);
    emit(ChangeDrkModeState());
  }

  List<dynamic> search = [];

  void SearhNews(value) {
    search = [];
    emit(LoadeSearcheNews());
    DioHelper.getData("v2/everything", {
      "apiKey": "5f78b1bdfdd84eb08d4ced0d1cd9372b",
      "q": "$value",
    }).then((value) {
      search = value.data['articles'];
      emit(LoadeSearchNewsSucces());
    }).catchError((onError) {
      print(onError);
      emit(LoadeSearchNewsError(onError));
    });
  }
}
