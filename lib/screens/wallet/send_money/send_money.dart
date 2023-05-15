import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../widgets/input_widget.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Money'),),
      body:  ListView(
        children:    [
          const SizedBox(height: 20,),
          Card(elevation: 4,
            // color: Colors.orange,
            child: ListTile(
                onTap: (){
                  Utils.popupAwesome(context, Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Send Money', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: nameController,
                          icon: Icons.person,
                          hintText: 'Enter Name',
                          keyBordType: TextInputType.name),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          controller: textEditingController,
                          icon: Icons.phone_iphone,
                          hintText: 'Enter Mobile Number',
                          keyBordType: TextInputType.number),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          controller: amountController,
                          icon: Icons.currency_bitcoin,
                          hintText: 'Enter Amount',
                          keyBordType: TextInputType.number),
                    ],
                  ), (){
                    Utils.snackBar('Sent Cash Successfully to your friends', context);
                  });
                },
                splashColor: Colors.green,
                title: const Text('Send Cash'),
                leading: const CircleAvatar( backgroundImage: AssetImage('./assets/images/cash.jpeg'),
                )

            ),
          ),
          Card(elevation: 5,
            child: ListTile(
                onTap: (){
                  Utils.popupAwesome(context, Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Send Internal Transfer', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20),
                      CustomTextField(
                          controller: textEditingController,
                          icon: Icons.phone_iphone,
                          hintText: 'Enter Mobile Number',
                          keyBordType: TextInputType.number),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          controller: amountController,
                          icon: Icons.currency_bitcoin,
                          hintText: 'Enter Amount',
                          keyBordType: TextInputType.number),
                    ],
                  ), (){Utils.snackBar('Sent Successfully ', context);});
                },
                splashColor: Colors.green,
                title: const Text('Send to Internal Wallet'),
                leading: const CircleAvatar( backgroundImage: AssetImage('./assets/images/logo.jpg'),
                )

            ),
          ),
          const SizedBox(height: 20),
          Card(elevation: 4,
            // color: Colors.orange,
            child: ListTile(
                onTap: (){
                  Utils.popupAwesome(context, Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Send Money to Bank', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          controller: nameController,
                          icon: Icons.person,
                          hintText: 'Enter Title:',
                          keyBordType: TextInputType.name),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          controller: textEditingController,
                          icon: Icons.account_balance,
                          hintText: 'Enter Account Number',
                          keyBordType: TextInputType.number),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                          controller: amountController,
                          icon: Icons.currency_bitcoin,
                          hintText: 'Enter Amount',
                          keyBordType: TextInputType.number),
                    ],
                  ), (){Utils.snackBar('Sent Successfully to bank ', context);});
                },
                splashColor: Colors.green,
                title: const Text('Send to Bank'),
                leading: const CircleAvatar( backgroundImage: AssetImage('./assets/images/bank.jpeg'),
                )

            ),
          ),
        ],
      ),
    );
  }
}