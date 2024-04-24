import 'package:bloc/bloc.dart';
import 'package:bloc_demo/switchsliderbloc/switchSliderEvent.dart';
import 'package:bloc_demo/switchsliderbloc/switchSliderState.dart';
class SwitchSliderBloc extends Bloc<SwitchSliderEvent,SwitchSliderState>{
  SwitchSliderBloc():super(SwitchSliderState()){
    on<EnableDisableNotificationEvent>(_enableDisableNotification);
    on<SliderEvent>(_slideYourSlider);
  }
  
  void _enableDisableNotification(EnableDisableNotificationEvent enableDisableNotification,Emitter<SwitchSliderState> emit){
    emit(state.copyWith(switchValue:!state.isSwitch));
  }

  void _slideYourSlider(SliderEvent sliderEvent,Emitter<SwitchSliderState> emit){
    emit(state.copyWith(sliderValue:sliderEvent.sliderValue));
  }
}