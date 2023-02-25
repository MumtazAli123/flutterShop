import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageInputScreen extends StatefulWidget {
  const ImageInputScreen({Key? key}) : super(key: key);

  @override
  State<ImageInputScreen> createState() => _ImageInputScreenState();
}

class _ImageInputScreenState extends State<ImageInputScreen> {
  final urlImage = "https://imglarger.com/Images/before-after/ai-image-enlarger-1-after-2.jpg";
  bool isFile = false;
  File? _imageFile;
  late Uint8List memoryImage;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      _imageFile = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.orange)),
          // ignore: unnecessary_null_comparison
          child: _imageFile != null
              ? Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                )
              : const Text('No Image Yet'),
        )
      ],
    );
  }
}
