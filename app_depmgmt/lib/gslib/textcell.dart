import 'package:flutter/material.dart';

class MultipleTextCell extends StatelessWidget {
  final String depmessage;
  final int index; 

  MultipleTextCell(this.depmessage, this.index);

  @override
  Widget build(BuildContext context) {
    // just paste the original file with child: xxxxx
    return new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(depmessage, textScaleFactor: 1.5,),
          //new Text("test111", textScaleFactor: 1.5,),

          new Text(  "--------Container/Group show here $index ---------")
          //new Text("Container/Group show here")
          ],
        );
  }
}
