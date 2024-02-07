import 'package:bloc/bloc.dart';
import 'package:bloc_closing_question/blocs/auth/auth_event.dart';
import 'package:bloc_closing_question/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthStateLoggedOut()) {
    on<AuthEventLogin>((event, emit) {
      emit(const AuthStateLoggedIn());
    });
    on<AuthEventLogout>((event, emit) {
      emit(const AuthStateLoggedOut());
    });
  }
}
