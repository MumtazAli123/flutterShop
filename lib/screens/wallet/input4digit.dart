import 'package:flutter/material.dart';
import 'package:nodejs/utils/utils.dart';
import 'package:nodejs/widgets/custom_button.dart';
import 'package:velocity_x/velocity_x.dart';

class ScreenInput4Digit extends StatefulWidget {
  const ScreenInput4Digit({Key? key}) : super(key: key);

  @override
  State<ScreenInput4Digit> createState() => _ScreenInput4DigitState();
}

class _ScreenInput4DigitState extends State<ScreenInput4Digit> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.green,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  _buildAppBar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text('Enter 4 Digit code'),
      centerTitle: true,

    );
  }
  _buildBody(){
    return Center(
      child: Column(
        children: [
          Container(
            width: 100,
            padding: const EdgeInsets.all(10),
            height: 100,
            child: const CircleAvatar(
              backgroundImage: AssetImage('./assets/images/dart.jpeg'),
            ),
          ),
          _buildLoginButton(),
          // const Text('0300 32** *26', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: SizedBox(
                  child: VStack([
                    _buildBody1(),
                    const Divider(),
                  ])),
            ),
          ).expand(),
        ],
      ),
    );
  }
  _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("Before not registered ?", style: TextStyle(color: Colors.white),),
        FilledButton(
            onPressed: () {
              Navigator.pushNamed(context, '/post');
              Utils.snackBar('Register new account', context);
            },
            child: const Text('Register now'))
      ],
    );
  }
  _buildBody1() {
    return Expanded(flex: 2,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildInputField(first: true, last: false),
                      _buildInputField(first: false, last: false),
                      _buildInputField(first: false, last: false),
                      _buildInputField(first: false, last: true),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                CustomButton(text: 'Submit', icon: Icons.person, onTap: (){
                  Navigator.pushNamed(context, '/wallet1');
                  Utils.snackBar('Welcome PaySaw Wallet', context);
                }),
                Row(
                  children: [
                    const Spacer(),
                    TextButton.icon(onPressed: (){
                      Navigator.pushNamed(context, '/post');
                      Utils.snackBar('Enter your number', context);
                    }, icon: const Icon(Icons.add),
                        label: const Text("Forgot Password"))

                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  _buildInputField({required bool first, last}){
    return Center(
      child: SizedBox(
        height: 85,
        child: AspectRatio(
          aspectRatio: 0.7,
          child: TextField(
            obscureText: true,
            autofocus: true,
            onChanged: (value){
              if (value.length == 1 && last == false){
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && first == false ){
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: false,
            readOnly: false,
            textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
                counter: const Offstage(),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2),
                    borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(width: 2, color: Colors.purple)
                )
            ),
          ),
        ),
      ),
    );
  }

}
