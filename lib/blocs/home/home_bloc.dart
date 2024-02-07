import 'package:bloc/bloc.dart';
import 'package:bloc_closing_question/blocs/home/home_event.dart';
import 'package:bloc_closing_question/blocs/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStateInitial()) {
    on<HomeEventComplete>((event, emit) {
      emit(HomeStateCompleted());
    });
  }
}
