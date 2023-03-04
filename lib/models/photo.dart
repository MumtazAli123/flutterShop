import 'dart:async';
import 'package:flutter/cupertino.dart';

class Photo {
   int id;
   String title;
   String des;
   String productName;

  Photo(
      { required this.id, required this.title, required this.des, required this.productName});

}

class ImageFile with ChangeNotifier {
  final List<Photo> _items = [];
  List<Photo> get items {
    return [..._items];
  }

  Future<void> addImagePlace(String title, String des, String aImage) async {
    final newImage = Photo(
        title: title, id: DateTime.daysPerWeek, des: des, productName: aImage);
    _items.add(newImage);
    notifyListeners();
  }
}