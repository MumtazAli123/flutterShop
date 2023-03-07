import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.controller, required this.hintText, required this.keyBordType});
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyBordType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBordType,
      controller: controller,
      decoration: InputDecoration(
        iconColor: Colors.green,
        hintText: hintText,
        suffixStyle: const TextStyle(fontSize: 18)
        // prefixIcon: const Icon(Icons.telegram),
        // border: const OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //     borderSide: BorderSide(color: Colors.black)),
        // enabledBorder: const OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(10)),
        //     borderSide: BorderSide(color: Colors.black)),
      ),
      // validator: (val) {},
    );
  }
}
