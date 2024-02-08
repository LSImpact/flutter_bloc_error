import 'package:bloc_closing_question/blocs/auth/auth_bloc.dart';
import 'package:bloc_closing_question/blocs/auth/auth_event.dart';
import 'package:bloc_closing_question/blocs/home/home_bloc.dart';
import 'package:bloc_closing_question/blocs/home/home_event.dart';
import 'package:bloc_closing_question/blocs/home/home_state.dart';
import 'package:bloc_closing_question/views/form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeView());
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeStateCompleted) {
            Navigator.of(context).pushAndRemoveUntil(
              FormView.route(),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is HomeStateInitial) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Home View'),
              ),
              body: Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context).add(
                          const HomeEventComplete(),
                        );
                      },
                      child: const Text('Go to Form'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          const AuthEventLogout(),
                        );
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
