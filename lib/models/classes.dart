import 'dart:io';
import 'package:flutter/cupertino.dart';

class AImage {
  final String id;
  final String title;
  final String des;
  final File? image;

  AImage(
      {required this.id, required this.title, required this.des, this.image});
}

class ImageFile with ChangeNotifier {
  final List<AImage> _items = [];
  List<AImage> get items {
    return [..._items];
  }

  Future<void> addImagePlace(String title, String des, File aImage) async {
    final newImage = AImage(
        id: DateTime.now().toString(), title: title, des: des, image: aImage);
    _items.add(newImage);
    notifyListeners();
  }
}
