import 'package:flutter_application_1/Shared/Cubit/Cubit.dart';

class StateApp {}

class InitialState extends StateApp {}

class CurrentIndexBottomNavigationState extends StateApp {}

class LoadeBusinessNews extends StateApp {}

class LoadeBusinessNewsSucces extends StateApp {}

class LoadeBusinessNewsError extends StateApp {
  final error;
  LoadeBusinessNewsError(this.error);

}

class LoadeSportNews extends StateApp {}

class LoadeSportNewsSucces extends StateApp {}

class LoadeSportNewsError extends StateApp {
   final error;
  LoadeSportNewsError(this.error);
}



class LoadeScienceNews extends StateApp {}

class LoadeSciencNewsSucces extends StateApp {}

class LoadeSciencNewsError extends StateApp {
     final error;
  LoadeSciencNewsError(this.error);
}
//******************************************* */
class ChangeDrkModeState extends StateApp{

}

class LoadeSearchNewsSucces extends StateApp {}

class LoadeSearchNewsError extends StateApp {
     final error;
  LoadeSearchNewsError(this.error);
}

class LoadeSearcheNews extends StateApp {}

class GoTO extends StateApp {}


class ChangeDarkModeByPreferancesState extends StateApp{

}

class ChangeDarkModeByPreferancesStateNot extends StateApp{

}