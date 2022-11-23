import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.email,
  }) : super(key: key);

  String? email;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
    _counter++;
    if (kDebugMode) {
      print(_counter);
    }
  }

  void _decrementCounter() {
      setState(() {});
      _counter--;
      if (kDebugMode) {
        print(_counter);
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 10,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Home'),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.menu),
          ),
        ],
        backgroundColor: Colors.deepOrange,
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
                  'Hello ${widget.email}!',
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
                child: Text(
                  _counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
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