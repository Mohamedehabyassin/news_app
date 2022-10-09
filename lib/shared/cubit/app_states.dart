abstract class AppStates {}

class InitialState extends AppStates {}

class ChangeNavbarState extends AppStates {}

class ChangeAppModeState extends AppStates {}

class BusinessSuccessState extends AppStates {}

class BusinessLoadingState extends AppStates {}

class BusinessErrorState extends AppStates {
  final String? error;

  BusinessErrorState({this.error});
}

class SportsSuccessState extends AppStates {}

class SportsLoadingState extends AppStates {}

class SportsErrorState extends AppStates {
  final String? error;

  SportsErrorState({this.error});
}

class ScienceSuccessState extends AppStates {}

class ScienceLoadingState extends AppStates {}

class ScienceErrorState extends AppStates {
  final String? error;

  ScienceErrorState({this.error});
}

class SearchSuccessState extends AppStates {}

class SearchLoadingState extends AppStates {}

class SearchErrorState extends AppStates {
  final String? error;

  SearchErrorState({this.error});
}
