import 'package:equatable/equatable.dart';
class TodoState extends Equatable{
    List<String> todoList;

    TodoState({ this.todoList = const ["1"]});

  @override
  List<Object?> get props => [todoList];

  TodoState copyWith({List<String> list = const []}){
    return TodoState(todoList: list ?? todoList);
  }

}