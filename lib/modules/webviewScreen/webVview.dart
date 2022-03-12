import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web_View extends StatelessWidget {
  final String url;
  Web_View(this.url);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back),color: Colors.black,),
        backgroundColor: Colors.white,
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
