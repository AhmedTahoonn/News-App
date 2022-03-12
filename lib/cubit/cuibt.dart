 import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/modules/businessScreen/Business_Screen.dart';
import 'package:newsapplication/modules/healthScreen/Health_Screen.dart';
import 'package:newsapplication/modules/scienceScreen/Science_Screen.dart';
import 'package:newsapplication/modules/sportsScreen/Sports_Screen.dart';
import 'package:newsapplication/network/local/cach.dart';
import 'package:newsapplication/network/remote/dio.dart';
import 'package:newsapplication/cubit/states.dart';

import '../modules/technologyScreen/Technology_Screen.dart';

class NewsAppCuibt extends Cubit<NewsAppStates>
{
  NewsAppCuibt() : super(NewsAppInitialState());

  int currentindex=0;
  List<Widget> Screen=[
    Business_Screen(),
    Health_Screen(),
    Sports_Screen(),
    Science_Screen(),
    Technology_Screen(),
  ];
  static NewsAppCuibt get(context)=>BlocProvider.of(context);
  void ChangeBottomNavigationBar(index)
  {

    currentindex=index;
    emit(NewsAppChangeBottomNavigationBarState());
  }
  List<dynamic>health=[];
  List<dynamic>sports=[];
  List<dynamic>science=[];
  List<dynamic>business=[];
  List<dynamic>technology=[];
  List<dynamic>search=[];


  void gethealth()
  {
    emit(NewsAppHealthLoadingsState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'health',
      'apiKey':'b1c211b7a25f49ea969931c755f5f7c6'

    }).then((value) {
     // print(value.data.toString());
      health=value.data['articles'];
      print(health[0]['title']);
      emit(NewsAppGetHealthSuccessState());
    }).catchError((error)
    {
      print('error${error.toString()}');
      emit(NewsAppGetHealthErrorState(error));
    });
  }

  void getSports()
  {
    emit(NewsAppGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'sports',
      'apiKey':'b1c211b7a25f49ea969931c755f5f7c6'

    }).then((value) {
      // print(value.data.toString());
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewsAppGetSportsSuccessState());
    }).catchError((error)
    {
      print('error${error.toString()}');
      emit(NewsAppGetSportsErrorState(error));
    });
  }
  void getscience()
  {
    emit(NewsAppGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'science',
      'apiKey':'b1c211b7a25f49ea969931c755f5f7c6'

    }).then((value) {
      // print(value.data.toString());
      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewsAppGetScienceSuccessState());
    }).catchError((error)
    {
      print('error${error.toString()}');
      emit(NewsAppGetScienceErrorState(error));
    });
  }

  void getBusiness()
  {
    emit(NewsAppBusinessLoadingsState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'business',
      'apiKey':'b1c211b7a25f49ea969931c755f5f7c6'

    }).then((value) {
      // print(value.data.toString());
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsAppGetBusinessSuccessState());
    }).catchError((error)
    {
      print('error${error.toString()}');
      emit(NewsAppGetBusinessErrorState(error));
    });
  }

  void gettechnology()
  {
    emit(NewsAppTechnologyLoadingsState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country':'eg',
      'category':'technology',
      'apiKey':'b1c211b7a25f49ea969931c755f5f7c6'

    }).then((value) {
      // print(value.data.toString());
      technology=value.data['articles'];
      print(technology[0]['title']);
      emit(NewsAppGetTechnologySuccessState());
    }).catchError((error)
    {
      print('error${error.toString()}');
      emit(NewsAppGetTechnologyErrorState(error));
    });
  }
  void getSearch(String value)
  {
    search=[];

    emit(SearchLoadingsState());

    DioHelper.getData(url: 'v2/everything', query: {
      'q':'${value}',
      'apiKey':'b1c211b7a25f49ea969931c755f5f7c6'

    }).then((value) {
      // print(value.data.toString());
      search=value.data['articles'];
      print(search[0]['title']);
      emit(SearchSuccessState());
    }).catchError((error)
    {
      print('error${error.toString()}');
      emit(SearchErrorState(error));
    });
  }
  bool isDark=false;
  void changeAppMode({sharedPreference}) {
    if (sharedPreference != null) {
      isDark = sharedPreference;
      emit(AppModeChangeState());

    }
    else{
      isDark = !isDark;
    CasheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppModeChangeState());
    });
  }
  }


}