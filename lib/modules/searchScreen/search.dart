import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapplication/cubit/states.dart';

import '../healthScreen/Health_Screen.dart';
import '../../cubit/cuibt.dart';

class search extends StatelessWidget {
 var searchcontroller=TextEditingController();
 var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCuibt,NewsAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            },icon: Icon(Icons.arrow_back,color: Colors.black,),),
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
          body: Form(
            key: formKey,
            child: Column(
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'can\'t be empty';
                        }
                        return null;
                      },
                      controller: searchcontroller,
                      keyboardType: TextInputType.text,
                      onTap: (){},
                      onChanged: (value){

                      },
                      onFieldSubmitted:(value){
                        NewsAppCuibt.get(context).getSearch(value);

                      } ,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      )
                  ),
                ),
                Expanded(
                  child: ConditionalBuilderRec(
                    condition:NewsAppCuibt.get(context).search.length>0 ,
                    builder: (context) {
                      return  ListView.separated(itemBuilder: (context, index) => buildArticleItem(NewsAppCuibt.get(context).search[index],context),
                          physics: BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => Container(
                            height: 1,
                            color: Colors.grey,
                          ),
                          itemCount: NewsAppCuibt.get(context).search.length);
                    },
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
