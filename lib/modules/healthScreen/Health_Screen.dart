
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/cubit/states.dart';
import 'package:newsapplication/modules/webviewScreen/webVview.dart';


import '../../cubit/cuibt.dart';

class Health_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Future refresh()async{
      await Future.delayed(Duration(seconds:2));

      NewsAppCuibt.get(context).gethealth();

    }
    return BlocConsumer<NewsAppCuibt,NewsAppStates>(
      builder: (context, state) {
        return Scaffold(
            body: ConditionalBuilderRec(
              condition:NewsAppCuibt.get(context).health.length>0 ,
              builder: (context) {
                return  RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView.separated(itemBuilder: (context, index) => buildArticleItem(NewsAppCuibt.get(context).health[index],context),
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      itemCount: NewsAppCuibt.get(context).health.length),
                );
              },
              fallback: (context) => Center(child: CircularProgressIndicator()),
            )
        );
      },
      listener:(context, state) {

      } ,

    );
  }
}

Widget buildArticleItem(article,context)=> InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Web_View(article['url']),));
  },
  child:   Padding(

    padding: const EdgeInsets.all(15.0),

    child: Row(

      children:

      [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']==null?'https://bitsofco.de/content/images/2018/12/Screenshot-2018-12-16-at-21.06.29.png':article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children:

              [

                Expanded(

                  child: Text('${article['title']}',

                    style: TextStyle(

                      fontSize: 16.0,

                      fontWeight: FontWeight.w600,

                    ),

                    maxLines: 4,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                SizedBox(

                  height: 5,

                ),

                Text('${article['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                    fontSize: 10.0,

                    fontWeight: FontWeight.w600,

                  ),

                ),





              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
