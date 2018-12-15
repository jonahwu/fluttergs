import 'package:flutter/material.dart';


class InfoScreen extends StatelessWidget{
  final int index;
  final String message;
  InfoScreen(this.message, this.index);
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Infomation Detailed"),),
        body: Center(child: Text("$message ----- $index", textScaleFactor: 1.5, ),),
      );
    }
}