import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/counter_logic_provider.dart';
import '../widgets/default_text.dart';

class CounterWithProvider extends StatefulWidget {
  const CounterWithProvider({
    Key? key,
  }) : super(key: key);


  @override
  State<CounterWithProvider> createState() => _CounterWithProviderState();
}

class _CounterWithProviderState extends State<CounterWithProvider> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late dynamic provider;

  @override
  void initState() {
    provider = Provider.of<CounterLogicProvider>(context, listen: false);
    super.initState();
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
          // Consumer<CounterLogicProvider>(
          //     builder: (context, value, child) =>
                  IconButton(
              onPressed: () => provider.decrementCounter(),
                  //context.read<CounterLogicProvider>().decrementCounter(),
              icon: const Icon(Icons.minimize)),
    // )
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
                child: Text(
                  '${Provider.of<CounterLogicProvider>(context, listen: true).counter}',
                    //'${context.watch<CounterLogicProvider>().counter}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:
    // Consumer<CounterLogicProvider>(
    //   builder: (context, value, child) =>
    FloatingActionButton(
        onPressed: () => provider.incrementCounter(),
            // context.read<CounterLogicProvider>().incrementCounter(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    // ),
    );
  }
}