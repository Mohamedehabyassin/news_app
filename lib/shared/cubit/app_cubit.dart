import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/app_states.dart';

class AppCubit extends Cubit{

  AppCubit():super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
}