import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 300,
        height: 40,
        child: ElevatedButton.icon(onPressed: onTap, icon: Icon(icon), label: Text(text)));
  }
}
