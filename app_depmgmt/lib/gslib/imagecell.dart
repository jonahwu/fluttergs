import 'package:flutter/material.dart';
import '../main.dart';

class ImageCell extends StatelessWidget {
  final String fm;
  ImageCell(this.fm);
  @override
  Widget build(BuildContext context) {
    // where Column describe the group of a Image and Text NOT a loop
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new FlatButton(
            child: new Image.asset('assets/jj.png'),
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      fullscreenDialog: false,
                      builder: (context) => DepAppState()));
            },
          ),
          Text(fm, textScaleFactor: 2)
        ]);
  }
}

class ImageCellOld extends StatelessWidget {
  //final List<String> fm;
  //ImageCell(this.fm);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new FlatButton(
          child: new Image.asset('assets/jj.png'),
        ),
        new FlatButton(
          child: new Image.asset('assets/jj.png'),
        ),
        new FlatButton(
          child: new Image.asset('assets/jj.png'),
        )
      ],
    );
  }
}
