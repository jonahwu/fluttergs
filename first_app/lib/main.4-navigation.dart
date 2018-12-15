// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold] and the [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      home: MyAppState(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyAppState extends StatefulWidget {
  //MyAppState({Key key}) : super(key: key);
  MyAppState({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListDisplay createState() => _ListDisplay();
}

class _ListDisplay extends State<MyAppState> {
  int _counter = 0;
  List<String> products = ['11111', '22222'];

  @override
  void initState() {
    super.initState();
    _counter = 10;
    print('into initState');
  }

  @override
  void didUpdateWidget(MyAppState oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('into didupdate');
  }

  void setData() {
    setState(() {
      //_counter++;
      _counter = _counter + 2;
      products.add('$_counter');
    });
  }

  void _adding() {
    // _counter = _counter + 1;
    setData();
    print(_counter);
  }

  void cleanData() {
    setState(() {
      //_counter++;
      _counter = 0;
      products.add('$_counter');
      products.clear();
    });
  }

  void _cleaning() {
    cleanData();
    print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
        /*
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.map),
            onPressed: _cleaning,
          )
        ],
        */
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.map),
            title: Text(products[index]),
          );
        }, // return ListTile(title: new Text("Number $index"));
      ),
      floatingActionButton: Column(children: <Widget>[
        Padding(
          padding: new EdgeInsets.symmetric(
            horizontal: 1.0,
          ),
        ),
        FloatingActionButton(
          child: new Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          heroTag: null,
          tooltip: 'Take a Photo',
          onPressed: _adding,
        ),
        FloatingActionButton(
          child: new Icon(
            Icons.restaurant,
            color: Colors.white,
          ),
          heroTag: null,
          onPressed: _adding,
          tooltip: 'Take a Photo',
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black12,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))),
        child: new BottomNavigationBar(
          fixedColor: Colors.lightBlue,
          items: [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.home), title: new Text("每日干货")),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.category),
              title: new Text("分类阅读"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.whatshot),
              title: new Text("匠心写作"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.search),
              title: new Text("搜索"),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          onTap: (int selected) {
            setState(() {});
          },
        ),
      ),
/*
      floatingActionButton: FloatingActionButton(
        //onPressed: () {},
        onPressed: _adding,
        backgroundColor: Color.fromARGB(255, 128, 128, 128),
      ),
      */
    );
  }
}
