import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodejs/sqlflite/sql_helper.dart';
import '../../models/photo.dart';
import '../../utils/utils.dart';
import '../../widgets/input_widget.dart';
import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;


class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();

  void imageSaveAt(String? saveImagePath) {}
}

class _WalletScreenState extends State<WalletScreen> {
  late Future<File> imageFile;
  late Image image;
   late final SQLHelper dbHelper;
  late List<Photo> images;

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = [];
    dbHelper = SQLHelper();
  }
  refreshImages(){
    SQLHelper.getItems().then((imgs) {
      images.clear();
      images.addAll(imgs as Iterable<Photo>);
    });
  }
  pickImageFromGallery() {
    // ignore: invalid_use_of_visible_for_testing_member
    ImagePicker().pickImage(source: ImageSource.gallery).then( (imageFile)async{
      // ignore: unnecessary_null_comparison
      if (image == null) return;
      final imageTemporary = File(image.repeat as String);
      setState(() {
        imageFile = imageTemporary as XFile?;
      });
      final apDir = syspath.getApplicationDocumentsDirectory();
      final saveImagePath = await imageFile?.path;
      widget.imageSaveAt(saveImagePath);
      refreshImages();
    });
    
  }

  gridView(){
    return  Padding(padding: const EdgeInsets.all(10.0),
      child: GridView.count(crossAxisCount: 2,
      children: [],
      ),

    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      title: const Text('Wallet'),
    );
  }
  _buildBody(){}
}

