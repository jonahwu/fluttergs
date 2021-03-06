import 'package:flutter/material.dart';
import './gslib/gstool.dart';
import 'dart:io';

void main() => runApp(DepApp());

class DepApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: DepAppState(),
    );
  }
}

class DepAppState extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomeDepAppState createState() => _HomeDepAppState();
}

class _HomeDepAppState extends State<DepAppState> {
  List<String> depMessage = ['message1', 'message2'];
  bool _loading = true;

  void _FetchData() async {
    print('into local fetch data');
    depMessage.add("adding one from FetchData");
    // sleep(const Duration(seconds: 3));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _loading = true;
    });
    print('initate data and circle first');
    _FetchData();
    setState(() {
      _loading = false;
    });
  }

  @override
  void didUpdateWidget(DepAppState oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('into App');
    return Scaffold(
      appBar: AppBar(
        title: Text('Department Management'),
        // action button will refesh the screen
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              tooltip: 'Open shopping cart',
              onPressed: () {
                print('isloading now....');
                setState(() {
                  _loading = true;
                });
                _FetchData();
                setState(() {
                  _loading = false;
                });
              }),
        ],
      ),
      //body: ,
      body: Center(
          child: _loading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: depMessage.length,
                  itemBuilder: (context, index) {
                    //  return Text(depMessage[index]);
                    return Column(
                      children: <Widget>[
                        new Container(
                          padding: new EdgeInsets.all(16.0),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(depMessage[index]),
                              new Text("--------Container/Group show here $index ---------")
                            ],
                          ),
                        )
                      ],
                    );
                  },
                )),
    );
  }
}
