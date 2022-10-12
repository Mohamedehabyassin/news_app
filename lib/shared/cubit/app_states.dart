abstract class AppStates {}

class InitialState extends AppStates {}

class ChangeNavbarState extends AppStates {}

class ChangeAppModeState extends AppStates {}

class BusinessSuccessState extends AppStates {}

class BusinessErrorState extends AppStates {
  final String? error;

  BusinessErrorState({this.error});
}

class SportsSuccessState extends AppStates {}

class SportsErrorState extends AppStates {
  final String? error;

  SportsErrorState({this.error});
}

class ScienceSuccessState extends AppStates {}

class ScienceErrorState extends AppStates {
  final String? error;

  ScienceErrorState({this.error});
}

class SearchSuccessState extends AppStates {}

class SearchErrorState extends AppStates {
  final String? error;

  SearchErrorState({this.error});
}
