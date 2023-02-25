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
    late File _imageFile;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.orange)
          ),
          // ignore: unnecessary_null_comparison
          child: _imageFile !=null?Image.file(_imageFile, fit: BoxFit.cover,): const Text('No Image Yet'),
        )
      ],
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<File>('_imageFile', _imageFile));
  }
}
