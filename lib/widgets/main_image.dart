import 'package:flutter/cupertino.dart';
import 'package:googleapis/calendar/v3.dart';

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/dart5.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text('Explore Foods', style: TextStyle(fontSize: 30,color: CupertinoColors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
