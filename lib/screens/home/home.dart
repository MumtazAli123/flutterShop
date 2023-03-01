import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nodejs/features/auth/auth_screen.dart';
import 'package:nodejs/models/classes.dart' as ima;
import 'package:nodejs/sqlflite/sql_helper.dart';
import 'package:nodejs/utils/utils.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;
  final ImagePicker _pickerController = ImagePicker();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  final urlImage =
      "https://www.collinsdictionary.com/images/full/apple_158989157.jpg";

  Future<void> _addItem(ImageSource source) async {
    await SQLHelper.creatItem(_titleController.text, _desController.text,
        _pickerController.pickImage(source: source) as String);
    _refreshJournals();
    print(".. Number of items ${_journals.length} ");
  }

  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  Future <void> _updateItem (int id, ImageSource source)async{
    await SQLHelper.updateItem(
        id, _titleController.text,
        _desController.text, _pickerController.pickImage(source: source) as String);
  }

  Future <void> _deleteItem (int id,) async{
    Utils.snackBar1('message', context);

  }

  @override
  void initState() {
    super.initState();
    _refreshJournals();
    print(".. Number of items ${_journals.length} ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/post");
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.image),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.green,
      centerTitle: true,
      title: const Text(
        "Home ",
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AuthScreen.routeName);
            },
            icon: const Icon(Icons.person))
      ],
    );
  }

  _buildBody() {
    return Center(
      child: SizedBox(width: 300, height: 300, child: Image.network(urlImage)),
    );
  }
}
