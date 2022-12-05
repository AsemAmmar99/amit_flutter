import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/default_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late StreamController _streamController;
  late Stream _stream;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

    @override
    void initState() {
    _streamController = StreamController();
    _stream = _streamController.stream;
    super.initState();
  }

  void _incrementCounter() {
    _streamController.sink.add(_counter++);
  }

  void _decrementCounter() {
    _streamController.sink.add(_counter--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Colors.indigo,
        width: 60.w,
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
                  children: [
                    Icon(Icons.supervised_user_circle, size: 25.sp,),
                    DefaultText(
                      text: 'Counter',
                      fontSize: 20.sp,
                    ),
                  ],
                ),
            ),
            Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.home),
                  title: DefaultText(text: 'Home'),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  leading: Icon(Icons.favorite),
                  title: DefaultText(text: 'Favourite'),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 10,
        leading: IconButton(
            onPressed: (){
              _scaffoldKey.currentState!.openDrawer();
        },
            icon: const Icon(Icons.key_sharp)),
        title: const Text('Home'),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
              onPressed: () => _decrementCounter(),
              icon: const Icon(Icons.minimize)),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.sp),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: [
                  Colors.deepOrangeAccent,
                  Colors.yellowAccent,
                ],
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25.sp),
            boxShadow: const [
              BoxShadow(
                spreadRadius: 5,
                color: Colors.grey,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Text(
                  'Hello!',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic
                  ),
                ),
              ),
              Flexible(
                flex: 10,
                child: StreamBuilder(
                  stream: _stream,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data != null ? snapshot.data.toString() : '0',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}