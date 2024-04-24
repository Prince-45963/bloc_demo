import 'package:bloc_demo/blocs/todo_bloc/todo_bloc.dart';
import 'package:bloc_demo/blocs/todo_bloc/todo_event.dart';
import 'package:bloc_demo/blocs/todo_bloc/todo_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
         if( state.todoList.isEmpty){
           return Center(
             child: Text("No data found"),
           );

         }

          else {
            return ListView.builder(
                itemCount: state.todoList?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(index.toString()),
                        GestureDetector(
                          onTap: (){
                            context.read<TodoBloc>().add(RemoveTodoEvent(index: index));

                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<TodoBloc>().add(AddTodoEvent());

      },child: Icon(Icons.add),),
    );
  }
}
