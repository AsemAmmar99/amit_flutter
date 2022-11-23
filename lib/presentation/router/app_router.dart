import 'package:amit_flutter/presentation/screens/login_screen.dart';
import 'package:amit_flutter/presentation/screens/my_app.dart';
import 'package:amit_flutter/constants/screens.dart' as screens;
import 'package:amit_flutter/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  late Widget startScreen;

  Route? onGenerateRoute(RouteSettings settings){
    startScreen = const OnBoardingScreen();

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
          case screens.loginScreen:
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          case screens.homeScreen:
            final String email = settings.arguments as String;
            return MaterialPageRoute(builder: (_) => MyHomePage(email: email,));
      default:
        return null;
    }
  }
}