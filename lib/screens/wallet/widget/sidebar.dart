import 'package:flutter/material.dart';
import 'package:nodejs/widgets/custom_button.dart';

class SideBarScreen extends StatelessWidget {
  const SideBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children:  [
          UserAccountsDrawerHeader(
            accountName: const Text('Imran Ali', style: TextStyle(color: Colors.white),),
            accountEmail: const Text("imran@gmail.com", style: TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              child: InkWell(onTap: (){

              },
                child: ClipOval(
                  child: Image.asset('./assets/images/dart.jpeg',height: double.infinity, fit: BoxFit.cover,),
                ),
              ),

            ),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text("Account Email"),
            subtitle: Text("imran****@*****.com"),
            splashColor: Colors.green,
            trailing: Text('Unverified'),
          ),

           const ListTile(
            leading: Icon(Icons.phone_iphone),
            title: Text("Account Number"),
            subtitle: Text("0300 32* *037"),
            splashColor: Colors.green,
            trailing: Text('Unverified'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.wallet) ,
            title: const Text("Account "),
            subtitle: const Text("History PaySaw Wallet"),
            splashColor: Colors.green,
            trailing:  IconButton(onPressed: (){

            },icon: const Icon(Icons.send),),
          ),
          const Divider(),
          const SizedBox(height: 90,),
          Padding(
            padding:  const EdgeInsets.all(8.0),
            child:  CustomButton(text: 'Logout', icon:  Icons.lock, onTap: () {
              Navigator.pushNamed(context, '/');
            },)
          ),
        ],
      ),
    );
  }
}
