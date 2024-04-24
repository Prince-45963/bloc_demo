import 'package:equatable/equatable.dart';
abstract class TodoEvent extends Equatable {


}

class AddTodoEvent extends TodoEvent {
  @override
  List<Object?> get props => [];

}

class RemoveTodoEvent extends TodoEvent {
  int index;
  RemoveTodoEvent({required this.index});
  @override
  List<Object?> get props => [index];

}