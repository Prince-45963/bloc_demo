
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/counterbloc/counterBloc.dart';
import '../../blocs/counterbloc/counterEvent.dart';
import '../../blocs/counterbloc/counterState.dart';


class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(state.counter.toString());
          },
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());

            }, child: Text("Increment")),
            ElevatedButton(onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());

            }, child: Text("Decrement"))

          ],
        )
      ],
    );
  }
}
