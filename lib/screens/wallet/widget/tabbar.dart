import 'package:flutter/material.dart';
import 'package:nodejs/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../widgets/input_widget.dart';

class ScreenTabBar extends StatelessWidget {
  const ScreenTabBar({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    return TabBar(
      controller: controller,
      indicatorColor: Colors.blue,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: Colors.green,
      labelPadding: Vx.m12,
      unselectedLabelColor: Colors.red,
      tabs: [
        IconButton(
            onPressed: () {
              Utils.popupAwesome(
                  context,
                  Column(
                    children: [
                      CustomTextField(
                        controller: textController,
                        hintText: 'Enter Account ',
                        keyBordType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: amountController,
                        hintText: 'Enter Amount',
                        keyBordType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  () {});
            },
            icon: const Icon(Icons.send)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wallet_topUp');
            }, icon: const Icon(Icons.align_vertical_bottom)),
        IconButton(onPressed: () {
          Navigator.pushNamed(context, '/wallet_history');
        }, icon: const Icon(Icons.receipt)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/agent');
            },
            icon: const Icon(Icons.pin_drop))
      ],
    );
  }
}
