import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/module/business_screen.dart';
import 'package:news_app/module/science_screen.dart';
import 'package:news_app/module/sports_screen.dart';
import 'package:news_app/shared/cubit/app_states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  int currentIndex = 0;

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void changeAppThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.setData(key: 'isDark', value: isDark)
        .then((value) => emit(ChangeAppModeState()));
  }

  List<Widget> screenItems = const [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: 'Sports'),
  ];

  void changeBottomNavbar(int index) {
    currentIndex = index;
    if (index == 1) getScience();
    if (index == 2) getSports();
    emit(ChangeNavbarState());
  }

  void getBusiness() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'db117497e9ed4345b0471685a86528c6',
      },
    ).then((value) {
      business = value?.data['articles'];
      emit(BusinessSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(BusinessErrorState(error: error.toString()));
    });
  }

  void getSports() {
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'db117497e9ed4345b0471685a86528c6',
        },
      ).then((value) {
        sports = value?.data['articles'];
        emit(SportsSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(SportsErrorState(error: error.toString()));
      });
    } else {
      emit(SportsSuccessState());
    }
  }

  void getScience() {
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'db117497e9ed4345b0471685a86528c6',
        },
      ).then((value) {
        science = value?.data['articles'];
        emit(ScienceSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());
        emit(ScienceErrorState(error: error.toString()));
      });
    } else {
      emit(ScienceSuccessState());
    }
  }

  void getSearch(String searchValue) {
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': searchValue,
        'apiKey': 'db117497e9ed4345b0471685a86528c6',
      },
    ).then((value) {
      search = value?.data['articles'];
      emit(SearchSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(SearchErrorState(error: error.toString()));
    });
  }
}
