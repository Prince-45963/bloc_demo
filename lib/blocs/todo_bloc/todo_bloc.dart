import 'package:bloc/bloc.dart';
import 'package:bloc_demo/blocs/todo_bloc/todo_event.dart';
import 'package:bloc_demo/blocs/todo_bloc/todo_state.dart';
class TodoBloc extends Bloc<TodoEvent,TodoState>{
  TodoBloc():super(TodoState()){
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }
  
  void _addTodo(AddTodoEvent event,Emitter<TodoState> states ){
    List<String> newList = List.from(state.todoList); // Create a new modifiable list
    newList.add("1");
    emit(state.copyWith(list: newList));
  }

  void _removeTodo(RemoveTodoEvent event,Emitter<TodoState> states ){


    List<String> newList = List.from(state.todoList); // Create a new modifiable list
    newList.removeAt(event.index);
    emit(state.copyWith(list: newList));
  }

}