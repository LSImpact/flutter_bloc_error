import 'package:bloc_closing_question/blocs/auth/auth_bloc.dart';
import 'package:bloc_closing_question/blocs/auth/auth_event.dart';
import 'package:bloc_closing_question/blocs/auth/auth_state.dart';
import 'package:bloc_closing_question/views/auth_view.dart';
import 'package:bloc_closing_question/views/form_view.dart';
import 'package:bloc_closing_question/views/home_view.dart';
import 'package:bloc_closing_question/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _MainAppState();
}

class _MainAppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: _navigatorKey,
        builder: (context, child) {
          BlocProvider.of<AuthBloc>(context).add(const AuthEventInit());
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              switch (state.runtimeType) {
                case AuthStateLoggedOut:
                  _navigator.pushAndRemoveUntil(
                    AuthView.route(),
                    (route) => false,
                  );
                case AuthStateLoggedIn:
                  _navigator.pushAndRemoveUntil(
                    HomeView.route(),
                    (route) => false,
                  );
                default:
                  break;
              }
            },
            child: child,
          );
        },
        onGenerateRoute: (_) => SplashView.route());
  }
}
