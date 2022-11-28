import 'package:amit_flutter/data/local/my_cache.dart';
import 'package:amit_flutter/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppRouter appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGenerateRoute,
      );
    }
    );
  }
}