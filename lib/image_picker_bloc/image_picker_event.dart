
import 'package:equatable/equatable.dart';
abstract class ImagePickerEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CameraImageEvent extends ImagePickerEvent {

}

class GalleryImageEvent extends ImagePickerEvent {

}