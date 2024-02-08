import 'package:bloc_closing_question/views/auth_view.dart';
import 'package:bloc_closing_question/views/form_view.dart';
import 'package:bloc_closing_question/views/home_view.dart';
import 'package:bloc_closing_question/views/splash_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashView());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthView());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/form':
        return MaterialPageRoute(builder: (_) => const FormView());
      default:
        return null;
    }
  }
}
