import 'package:bloc_demo/ui/counter/counter.dart';
import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int counter;
  const CounterState({this.counter = 0});
  @override
  List<Object?> get props => [counter];

  CounterState copyWith({int? Counter}){
return CounterState(counter: Counter ?? this.counter);
  }


}