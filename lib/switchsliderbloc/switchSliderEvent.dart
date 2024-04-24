
import 'package:equatable/equatable.dart';
abstract class SwitchSliderEvent extends Equatable{



}

class EnableDisableNotificationEvent extends SwitchSliderEvent{
  @override
  List<Object?> get props => [];

}

class SliderEvent extends SwitchSliderEvent{
  double sliderValue;
  SliderEvent({required this.sliderValue});

  @override
  List<Object?> get props => [sliderValue];


}