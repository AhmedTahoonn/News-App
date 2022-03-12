import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/cubit/states.dart';

import '../healthScreen/Health_Screen.dart';
import '../../cubit/cuibt.dart';

class Business_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Future refresh()async{
      await Future.delayed(Duration(seconds:2));

      NewsAppCuibt.get(context).getBusiness();

    }
    return BlocConsumer<NewsAppCuibt,NewsAppStates>(
      builder: (context, state) {
        return Scaffold(
            body: RefreshIndicator(
              onRefresh: refresh,
              child: ConditionalBuilderRec(
                condition:NewsAppCuibt.get(context).business.length>0 ,
                builder: (context) {
                  return  ListView.separated(itemBuilder: (context, index) => buildArticleItem(NewsAppCuibt.get(context).business[index],context),
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      itemCount: NewsAppCuibt.get(context).business.length);
                },
                fallback: (context) => Center(child: CircularProgressIndicator()),
              ),
            )
        );
      },
      listener:(context, state) {

      } ,

    );
  }
}
