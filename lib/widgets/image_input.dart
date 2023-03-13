import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInputScreen extends StatefulWidget {
  final Function imageSaveAt;
  const ImageInputScreen(this.imageSaveAt, {super.key});

  @override
  State<ImageInputScreen> createState() => _ImageInputScreenState();
}

class _ImageInputScreenState extends State<ImageInputScreen> {
  final urlImage = "https://images.freeimages.com/images/previews/ac9/railway-hdr-1361893.jpg";
  bool isFile = false;
  File? _imageFile;
  late Uint8List memoryImage;

  Future getImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source, maxWidth: 600);
    if (image == null) return;
    final imageTemporary = File(image.path);
    setState(() {
      _imageFile = imageTemporary;
    });
    final apDir = syspath.getApplicationDocumentsDirectory();
    final saveImagePath = await _imageFile?.copy('$apDir/$imageTemporary');
    widget.imageSaveAt(saveImagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 200,
          decoration:
              BoxDecoration(border: Border.all(width: 2, color: Colors.orange)),
          // ignore: unnecessary_null_comparison
          child: _imageFile != null
              ? Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                )
              :  Image.network(urlImage, fit: BoxFit.cover,),
        ),
        Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(onPressed: (){
              getImage(ImageSource.gallery);
            }, icon: const Icon(Icons.image), label: const Text('Add image')),
            TextButton.icon(onPressed: (){
              getImage(ImageSource.camera);
            }, icon: const Icon(Icons.camera_alt), label: const Text('Take image')),
          ],
        ),
      ],
    );
  }
}
