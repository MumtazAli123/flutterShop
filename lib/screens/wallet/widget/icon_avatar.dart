import 'package:flutter/material.dart';
import 'package:nodejs/utils/utils.dart';
import 'package:nodejs/widgets/input_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class IconsAvatarScreen extends StatelessWidget {
  const IconsAvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return VStack([
      VxBox(
              child: VxBox(
                  child: SizedBox(
        height: 305,
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          clipBehavior: Clip.none,
          children: [
            _buildIconsAvatar('Mobile', Icons.phone_iphone, () {
              Navigator.pushNamed(context, '/mobile');
            }),
            _buildIconsAvatar('Send', Icons.send, () {
              Navigator.pushNamed(context, '/send_money');
            }),
            _buildIconsAvatar('TopUp', Icons.hourglass_top, () {
              Navigator.pushNamed(context, '/wallet_topUp');
            }),
            _buildIconsAvatar('ReadyCash', Icons.money, () {
              Navigator.pushNamed(context, '/agent');
            }),
            _buildIconsAvatar('Nol Card', Icons.card_travel, () {
              Navigator.pushNamed(context, '/nolCard');
            }),
            _buildIconsAvatar('Banking', Icons.location_city, () {
              Navigator.pushNamed(context, '/banking');
            }),
            _buildIconsAvatar('Electricity', Icons.electric_meter, () {
              Navigator.pushNamed(context, '/utility');
            }),
            _buildIconsAvatar('Gas', Icons.gas_meter, () {
              Navigator.pushNamed(context, '/utility');
            }),
            _buildIconsAvatar('Water', Icons.water_drop_outlined, () {
              Navigator.pushNamed(context, '/utility');
            }),
            _buildIconsAvatar('Internet', Icons.interests, () {
              Navigator.pushNamed(context, '/internet');
            }),
            _buildIconsAvatar('M-Tag', Icons.tag_faces, () {
              Utils.popupAwesome(context, Column(
                children: [
                  CustomTextField(controller: textEditingController, hintText: 'Enter M-Tag Acc', keyBordType: TextInputType.number),
                  const SizedBox(height: 20,),
                ],
              ), (){});
            }),
            _buildIconsAvatar('Fees', Icons.school_rounded, () {
              Navigator.pushNamed(context, '/schools');
            }),
          ],
        ),
      )).make())
          .make()
    ]);
  }
}

_buildIconsAvatar(String name, IconData icon, final void Function() onPressed) {
  return Column(
    children: [
      Card(
        elevation: 2,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.green,
            size: 30,
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        name,
        style: const TextStyle(color: Colors.black),
      ),
    ],
  );
}
