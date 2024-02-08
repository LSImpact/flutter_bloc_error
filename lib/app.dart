import 'package:bloc_closing_question/app_router.dart';
import 'package:bloc_closing_question/blocs/auth/auth_bloc.dart';
import 'package:bloc_closing_question/blocs/auth/auth_state.dart';
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
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case AuthStateLoggedOut:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/auth', (route) => false);
              case AuthStateLoggedIn:
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home', (route) => false);
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: _router.onGenerateRoute,
    );
  }
}
