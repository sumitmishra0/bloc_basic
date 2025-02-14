import 'package:bloc_first/bloc/counter_events.dart';
import 'package:bloc_first/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc(super.initialState) {

    // events
    on<IncrementCountEvents>((event, emit) {
      emit(CounterState(count: state.count + event.value));
    });

    on<DecrementCountEvents>((events, emit){
      if(state.count > 0)  emit(CounterState(count: state.count - 1)); 
    });
  }
}