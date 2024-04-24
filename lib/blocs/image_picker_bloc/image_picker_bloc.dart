import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent,ImagePickerState>{
  final ImagePickerUtils imagePickerUtil;
  ImagePickerBloc(this.imagePickerUtil):super(ImagePickerState()){
    on<CameraImageEvent>(_cameraPicker);
  }
  
  Future<void> _cameraPicker(ImagePickerEvent event,Emitter<ImagePickerState> states) async {
    XFile? file = await imagePickerUtil.galleryImagePicker();
    emit(state.copyWith(file:file));
  }
}