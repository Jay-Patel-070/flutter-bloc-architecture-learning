// counter_bloc.dart
import 'package:bloc/bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrementPressed>((event, emit) {
      emit(CounterState(state.value + 1));
    });
    on<CounterDecrementPressed>((event, emit) {
      emit(CounterState(state.value - 1));
    });
  }
}
