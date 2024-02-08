import 'package:bloc/bloc.dart';
import 'package:bloc_closing_question/blocs/auth/auth_event.dart';
import 'package:bloc_closing_question/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthStateUnknown()) {
    on<AuthEventInit>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(const AuthStateLoggedIn());
    });
    on<AuthEventLogin>((event, emit) {
      emit(const AuthStateLoggedIn());
    });
    on<AuthEventLogout>((event, emit) {
      emit(const AuthStateLoggedOut());
    });
  }
}
