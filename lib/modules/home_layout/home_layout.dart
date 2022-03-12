import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/modules/searchScreen/search.dart';
import 'package:newsapplication/cubit/states.dart';

import '../../cubit/cuibt.dart';

class home_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCuibt,NewsAppStates>(

      builder: (context, state) {
       return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text('News App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            actions:
            [
              IconButton(icon: Icon(Icons.search_sharp,),onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => search(),));
              },),
              IconButton(icon:NewsAppCuibt.get(context).isDark? Icon(Icons.wb_sunny):Icon(Icons.nightlight_round),onPressed: (){
                NewsAppCuibt.get(context).changeAppMode();
              },),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap:(index){
              NewsAppCuibt.get(context).ChangeBottomNavigationBar(index);
            } ,
            currentIndex:NewsAppCuibt.get(context).currentindex,
            items:
            [
              BottomNavigationBarItem(icon: Icon(Icons.business,),label: 'business'),
              BottomNavigationBarItem(icon: Icon(Icons.healing,),label: 'health'),
              BottomNavigationBarItem(icon: Icon(Icons.sports,),label: 'sports'),
              BottomNavigationBarItem(icon: Icon(Icons.science,),label: 'science'),
              BottomNavigationBarItem(icon: Icon(Icons.computer,),label: 'technology'),


            ],
          ),
         body:NewsAppCuibt.get(context).Screen[NewsAppCuibt.get(context).currentindex] ,

        );
      },
      listener: (context, state) {

      },
    );
  }
}
