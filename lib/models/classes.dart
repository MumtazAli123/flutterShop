import 'dart:io';
import 'package:flutter/cupertino.dart';

class Image {
  final String id;
  final String title;
  final String des;
  final File? image;

  Image(
      {required this.id, required this.title, required this.des, this.image});
}

class ImageFile with ChangeNotifier {
  final List<Image> _items = [];
  List<Image> get items {
    return [..._items];
  }

  Future<void> addImagePlace(String title, String des, File aImage) async {
    final newImage = Image(
        id: DateTime.now().toString(), title: title, des: des, image: aImage);
    _items.add(newImage);
    notifyListeners();
  }
}
