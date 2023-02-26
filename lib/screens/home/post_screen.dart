import 'package:flutter/material.dart';
import 'package:nodejs/models/classes.dart';
import 'package:nodejs/widgets/image_input.dart';
import 'package:nodejs/widgets/input_widget.dart';
import 'dart:io';
import 'package:provider/provider.dart';




class MyPostScreen extends StatefulWidget {
  const MyPostScreen({Key? key}) : super(key: key);


  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
   File? savedImage;
  final _titleController = TextEditingController();
  final _desController = TextEditingController();

  void savedImages (File image){
    savedImage = image;
  }

  void onSave(){
    if (_titleController.text.isEmpty|| _desController.text.isEmpty || savedImage==null){
      return;
    }
    else {
      Provider.of<ImageFile>(context, listen: false).addImagePlace(
          _titleController.text, _desController.text, savedImage!);
    }

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
      actions: [IconButton(onPressed: onSave, icon: const Icon(Icons.add))],
      centerTitle: true,
      // backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text("Post"),
    );
  }

  _buildBody(){
    return  Center(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: 400,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              CustomTextField(
                  controller: _titleController, hintText: 'Title'),
              const SizedBox(height: 20,),
              CustomTextField(controller: _desController, hintText: 'Description'),
              const SizedBox(height: 20,),
               ImageInputScreen(savedImages),

            ],
          ),
        ),
      ),
    );
  }
}
