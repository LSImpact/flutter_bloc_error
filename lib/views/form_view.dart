import 'package:bloc_closing_question/blocs/auth/auth_bloc.dart';
import 'package:bloc_closing_question/blocs/auth/auth_event.dart';
import 'package:bloc_closing_question/blocs/form/form_bloc.dart';
import 'package:bloc_closing_question/blocs/form/form_event.dart';
import 'package:bloc_closing_question/blocs/form/form_state.dart';
import 'package:bloc_closing_question/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const FormView());
  }

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormBloc(),
      child: BlocConsumer<FormBloc, FormBlocState>(
        listener: (context, state) {
          if (state is FormStateCompleted) {
            Navigator.of(context).pushAndRemoveUntil(
              HomeView.route(),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is FormStateEditingForm) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Form View'),
              ),
              body: Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<FormBloc>(context).add(
                          const FormEventComplete(),
                        );
                      },
                      child: const Text('Complete Form'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // var authBloc = BlocProvider.of<AuthBloc>(context);
                        //auth bloc is closed here
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
