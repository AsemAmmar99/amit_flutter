import 'package:amit_flutter/business_logic/counter_logic_provider.dart';
import 'package:amit_flutter/data/local/my_cache.dart';
import 'package:amit_flutter/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'business_logic/colors_cubit/colors_cubit.dart';
import 'business_logic/counter_cubit/counter_cubit.dart';
import 'constants/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context)
        => CounterCubit()),
        BlocProvider<ColorsCubit>(create: (context)
        => ColorsCubit()),
      ],
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterLogicProvider>(create: (context)
        => CounterLogicProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.onGenerateRoute,
        );
      }
      ),
    ),
    );
  }
}