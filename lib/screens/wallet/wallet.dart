import 'package:flutter/material.dart';
import 'package:nodejs/screens/wallet/widget/icon_avatar.dart';
import 'package:nodejs/screens/wallet/widget/sidebar.dart';
import 'package:nodejs/screens/wallet/widget/tabbar.dart';
import 'package:nodejs/utils/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> with TickerProviderStateMixin {
  bool _visible = true;
  late TabController _tabController;
  @override
  void initState() {;
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: const SideBarScreen(),
      backgroundColor: Colors.green,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: const Text(' PaySaw Wallet'),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, '/');
          Utils.snackBar('Welcome Home', context);
        }, icon: const Icon(Icons.home))
      ],
    );
  }
  _buildBody(){
    return  Center(
      child: Column(
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                './assets/images/dart.jpeg',
              ),
            ),
            title: Text(
              'Bha Imran Ali', style: TextStyle(color: Colors.white) ,
            ),
            subtitle: Text('0300 32** *26',  style: TextStyle(color: Colors.white) ),
            trailing:  Icon(Icons.heat_pump_rounded),


            // tileColor: Vx.white,
          ),
          _buildClipRRect()

        ],
      ),
    );
  }
  _buildClipRRect(){
    return   ClipRRect(
      borderRadius:  const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50)),
      child:  Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child:  SizedBox(
          child: VStack([
            _buildTabBar(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.wallet, color: Colors.blue,),
              title: Visibility(
                visible: _visible,
                child: const Text('3099.00', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),

              ),
              subtitle: const Text('Balance'),
              trailing: TextButton(
                onPressed: (){
                  setState(() {
                    _visible = !_visible;
                  });
                }, child: const Icon(Icons.visibility),
              )),
            const SizedBox(height: 10,),
            const Divider(),
            const SizedBox(height: 10,),
            _buildIconsAvatar(),
          ])),
    ),
    ).expand();
  }

  _buildTabBar(){
    return ScreenTabBar(controller: _tabController);
  }

  void togglePassword(){
    _visible = !_visible;
    setState(() {});
  }
  _buildIconsAvatar(){
    return const Expanded(child: Column(
      children: [
        IconsAvatarScreen(),
      ],
    ));
  }
}
