import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyBordType,
      this.icon});
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyBordType;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBordType,
      controller: controller,
      decoration: InputDecoration(
        iconColor: Colors.green,
        hintText: hintText,
        suffixStyle: const TextStyle(fontSize: 18),
        prefixIcon: Icon(icon),
      ),
      // validator: (val) {},
    );
  }
}
