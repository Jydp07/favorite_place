import 'dart:io';

import 'package:favorite_place/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImageInput extends StatefulWidget {
  const ImageInput({super.key,required this.onPickImage});

  final void Function(File image) onPickImage;
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takeImage() async{
    final imagePicker = ImagePicker();

    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera,maxWidth: 600);

    if(pickedImage == null){
      return;
    }

      setState(() {
        _selectedImage = File(pickedImage.path);
      });

    widget.onPickImage(_selectedImage!);
  }
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takeImage,
      icon: const Icon(Icons.camera, size: 40),
      label: const Text('Take picture'),
    );
    if(_selectedImage != null){
      content = GestureDetector(onTap: _takeImage,child: Image.file(_selectedImage!,fit: BoxFit.cover,width: double.infinity,height: double.infinity,));
    }
    return Container(
      alignment: Alignment.center,
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: colorScheme.onBackground.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: content,
    );
  }
}
