
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/switchsliderbloc/switchSliderBloc.dart';
import '../../blocs/switchsliderbloc/switchSliderEvent.dart';
import '../../blocs/switchsliderbloc/switchSliderState.dart';

class SwitchSlider extends StatefulWidget {
  const SwitchSlider({super.key});

  @override
  State<SwitchSlider> createState() => _SwitchSliderState();
}

class _SwitchSliderState extends State<SwitchSlider> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
        Column(
          children: [

            BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
              buildWhen: (prev,curr) => prev.isSwitch!=curr.isSwitch,
              builder: (context1, state) {
                print("Switch");

                return Switch(value: state.isSwitch, onChanged: (value) {
                  context.read<SwitchSliderBloc>().add(
                      EnableDisableNotificationEvent());
                });
              },
            ),
            SizedBox(height: 20,),
            BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
              buildWhen: (prev,curr) => prev.slider!=curr.slider,

              builder: (context, state) {
                print("Container");

                return Container(height: 200,
                  color: Colors.red.withOpacity(state.slider),);
              },
            ),
            BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
              buildWhen: (prev,curr) => prev.slider!=curr.slider,

              builder: (context2, state) {
                print("Slider");
                return Slider(value: state.slider, onChanged: (value) {
                  context.read<SwitchSliderBloc>().add(
                      SliderEvent(sliderValue: value));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
