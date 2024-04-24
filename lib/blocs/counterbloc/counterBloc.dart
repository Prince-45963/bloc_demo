import 'package:flutter/cupertino.dart';
import 'package:bloc/bloc.dart';

import 'counterEvent.dart';
import 'counterState.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounterEvent>(_increment);
    on<DecrementCounterEvent>(_decrement);

  }

  void _increment(IncrementCounterEvent event,Emitter<CounterState> emit){
    emit(state.copyWith(Counter:state.counter+1));
  }
  void _decrement(DecrementCounterEvent event,Emitter<CounterState> emit){
    emit(state.copyWith(Counter:state.counter-1));
  }
}
