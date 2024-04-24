
import 'package:bloc_demo/blocs/todo_bloc/todo_bloc.dart';
import 'package:bloc_demo/ui/counter/counter.dart';
import 'package:bloc_demo/ui/image_picker/image_picker_ui.dart';
import 'package:bloc_demo/ui/switchSlider/switchslider.dart';
import 'package:bloc_demo/ui/todo/todo_screen.dart';
import 'package:bloc_demo/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/counterbloc/counterBloc.dart';
import 'blocs/image_picker_bloc/image_picker_bloc.dart';
import 'blocs/switchsliderbloc/switchSliderBloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
            BlocProvider(create: (context) => CounterBloc(),),
        BlocProvider(create: (context) => SwitchSliderBloc(),),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()),),
        BlocProvider(create: (context) => TodoBloc(),)

      ],
      
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}


