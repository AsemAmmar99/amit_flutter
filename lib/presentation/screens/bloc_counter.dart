import 'package:amit_flutter/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../../business_logic/counter_cubit/counter_cubit.dart';
import '../widgets/default_text.dart';

class BlocCounter extends StatefulWidget {
  const BlocCounter({
    Key? key,
  }) : super(key: key);


  @override
  State<BlocCounter> createState() => _BlocCounterState();
}

class _BlocCounterState extends State<BlocCounter> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late CounterCubit cubit;

  @override
  void initState() {
    cubit = CounterCubit.get(context);
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
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
              icon: const Icon(Icons.key_sharp)),
          title: const Text('Home'),
          backgroundColor: Colors.deepOrange,
          actions: [
            // Consumer<CounterLogicProvider>(
            //     builder: (context, value, child) =>
            IconButton(
                onPressed: () => cubit.decrementCounter(),
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
                  child: BlocConsumer<CounterCubit, CounterStates>(
                    listener: (context, state) {
                      if(state is CounterIncreasedState){
                        Fluttertoast.showToast(
                            msg: "Counter Increased!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.sp
                        );
                      }else if(state is CounterDecreasedState){
                        Fluttertoast.showToast(
                            msg: "Counter Decreased!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.sp
                        );
                      }
                    },
                    builder: (context, state) {
                      if(state is CounterIncreasedState) {
                        return DefaultText(
                        text: '${cubit.counter}',
                          fontSize: 30.sp,
                          color: Colors.green,
                      );
                      }else if(state is CounterDecreasedState){
                        return DefaultText(
                          text: '${cubit.counter}',
                          fontSize: 30.sp,
                          color: Colors.red,
                        );
                      }else{
                        return DefaultText(
                          text: '${cubit.counter}',
                          fontSize: 30.sp,
                          color: black,
                        );
                      }
                    },
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
          onPressed: () => cubit.incrementCounter(),
          // context.read<CounterLogicProvider>().incrementCounter(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
    );
  }
}