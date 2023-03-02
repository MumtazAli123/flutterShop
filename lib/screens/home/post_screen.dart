import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nodejs/models/classes.dart';
import 'package:nodejs/widgets/custom_button.dart';
import 'package:nodejs/widgets/image_input.dart';
import 'package:nodejs/widgets/input_widget.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:nodejs/models/classes.dart';
import '../../sqlflite/sql_helper.dart';




class MyPostScreen extends StatefulWidget {
  const MyPostScreen({Key? key}) : super(key: key);


  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
   File? savedImage;
  final _titleController = TextEditingController();
  final _desController = TextEditingController();
  List<Map<String, dynamic>> _journals = [];
   bool _isLoading = true;

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

   Future<void> _addItem()async {
     await SQLHelper.creatItem(
         _titleController.text, _desController.text, savedImage! as String);
     _refreshJournals();
     if (kDebugMode) {
       print(".. Number of items ${_journals.length} ");
     }
   }
   Future<void> _updateItem(int id)async {
     await SQLHelper.updateItem(
         id, _titleController.text, _desController.text, savedImage! as String);
     _refreshJournals();
   }
   Future<void> _deleteItem(int id)async {
     await SQLHelper.deleteItem(id);
     // ignore: use_build_context_synchronously
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(backgroundColor: Colors.red,
             content: Text('Delete Successfully')));

     _refreshJournals();
   }


   void _refreshJournals()async{
     final data = await SQLHelper.getItems();
     setState ((){
       _journals = data;
       _isLoading = false;
     });
   }

   @override
   void initState(){
     super.initState();
     _refreshJournals();
     if (kDebugMode) {
       print(".. Number of items ${_journals.length} ");
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
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                CustomTextField(
                    controller: _titleController, hintText: 'Title'),
                const SizedBox(height: 20,),
                CustomTextField(controller: _desController, hintText: 'Description'),
                const SizedBox(height: 20,),
                 ImageInputScreen(savedImages),
                const SizedBox(height: 20,),
                CustomButton(text:  'Update', icon: Icons.add, onTap: ()async{
                  _titleController.text = '';
                  _desController.text = '';
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                })

              ],
            ),
          ),
        ),
      ),
    );
  }
}
