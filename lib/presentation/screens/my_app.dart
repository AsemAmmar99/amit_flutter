import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

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
        leading: Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 15),
          child: IconButton(
              onPressed: _decrementCounter,
              icon: const Icon(
                Icons.minimize,
                color: Colors.white,
                size: 30,
              ),
          ),
        ),
        title: Text(widget.title),
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
                  'You have pushed the button this many times:',
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