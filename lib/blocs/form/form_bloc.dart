import 'package:bloc/bloc.dart';
import 'package:bloc_closing_question/blocs/form/form_event.dart';
import 'package:bloc_closing_question/blocs/form/form_state.dart';

class FormBloc extends Bloc<FormEvent, FormBlocState> {
  FormBloc() : super(const FormStateEditingForm()) {
    on<FormEventComplete>((event, emit) {
      emit(const FormStateCompleted());
    });
  }
}
