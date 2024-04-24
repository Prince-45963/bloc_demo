import 'package:equatable/equatable.dart';
class SwitchSliderState extends Equatable{
   bool isSwitch;
   double slider;
SwitchSliderState({this.isSwitch = false,this.slider = 0.2});


  @override
  List<Object?> get props => [isSwitch, slider];

   SwitchSliderState copyWith({bool? switchValue, double? sliderValue}){
     return SwitchSliderState(isSwitch: switchValue ?? this.isSwitch,slider: sliderValue ?? this.slider);
   }

}