import 'package:flutter/material.dart';
import 'package:nodejs/widgets/image_input.dart';
import 'package:nodejs/widgets/input_widget.dart';


class MyPostScreen extends StatefulWidget {
  const MyPostScreen({Key? key}) : super(key: key);

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  final _titleController = TextEditingController();
  final _desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar(){
    return AppBar(
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
              const ImageInputScreen(),

            ],
          ),
        ),
      ),
    );
  }
}
