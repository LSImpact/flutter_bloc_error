import 'package:bloc_closing_question/blocs/auth/auth_bloc.dart';
import 'package:bloc_closing_question/blocs/auth/auth_event.dart';
import 'package:bloc_closing_question/blocs/auth/auth_state.dart';
import 'package:bloc_closing_question/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        //display loading screen
      },
      builder: (context, state) {
        if (state is AuthStateLoggedIn) {
          return const HomeView();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Auth View'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    const AuthEventLogin(),
                  );
                },
                child: const Text('Login'),
              ),
            ),
          );
        }
      },
    );
  }
}
