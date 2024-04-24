import 'dart:io' as i;
import 'package:bloc_demo/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_demo/image_picker_bloc/image_picker_event.dart';
import 'package:bloc_demo/image_picker_bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ImagePickerUI extends StatefulWidget {
  const ImagePickerUI({super.key});

  @override
  State<ImagePickerUI> createState() => _ImagePickerUIState();
}

class _ImagePickerUIState extends State<ImagePickerUI> {
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Center(
              child: (state.file==null) ? GestureDetector(onTap: (){
                context.read<ImagePickerBloc>().add(CameraImageEvent());

              },
                  child: const Icon(Icons.image)) : Image.file(i.File(state.file!.path.toString()))
            ),
          );
        },
      );
  }
}
