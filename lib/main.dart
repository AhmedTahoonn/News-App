import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapplication/network/local/cach.dart';
import 'package:newsapplication/network/remote/dio.dart';
import 'package:newsapplication/cubit/states.dart';

import 'cubit/bloc_observe.dart';
import 'cubit/cuibt.dart';
import 'modules/home_layout/home_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
   DioHelper.init();
  await CasheHelper.init();
  var  isDark=CasheHelper.getBoolean(key: 'isDark');
  runApp( MyApp(isDark!));
}

class MyApp extends StatelessWidget {
 final bool isDark;
   MyApp(this.isDark, {Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsAppCuibt()..getBusiness()..gethealth()..getSports()..getscience()..gettechnology()..changeAppMode(
        sharedPreference: isDark,
      ),

      child: BlocConsumer<NewsAppCuibt,NewsAppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:Colors.black,
                  statusBarBrightness: Brightness.light,
                ),
                backgroundColor: Colors.black,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color:Colors.white,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blueGrey,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,

              ) ,
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),
                  bodyText2: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  )
              ),

            ),
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.black,
                  statusBarBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color:Colors.black,
                ),
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepPurple,
                unselectedItemColor: Colors.blueGrey.withOpacity(0.8),
                elevation: 20.0,

              ) ,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
                bodyText2: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),

            ),
            themeMode: NewsAppCuibt.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: home_layout(),
          );
        },
      ),
    );
  }
}


