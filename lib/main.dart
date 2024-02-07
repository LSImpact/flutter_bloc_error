import 'package:bloc_closing_question/blocs/auth/auth_bloc.dart';
import 'package:bloc_closing_question/views/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: const AuthView(),
      ),
    );
  }
}
