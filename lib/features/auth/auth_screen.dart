import 'package:flutter/material.dart';
import 'package:nodejs/constants/global_varaible.dart';
import 'package:nodejs/widgets/custom_button.dart';
import 'package:nodejs/widgets/input_widget.dart';

enum Auth {
  signIn,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late Auth _auth = Auth.signIn;
  final _signupFromKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      forceMaterialTransparency: false,
      // backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text('Welcome'),
    );
  }

  _buildBody() {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildAccount(),
            const SizedBox(
              height: 20,
            ),
            if (_auth == Auth.signup)
              Container(
                padding: const EdgeInsets.all(28.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                width: 450,
                child: _buildSignupFormKey(),
              ),
            _buildSignIn(),
            if (_auth == Auth.signIn)
              Container(
                padding: const EdgeInsets.all(28.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    )),
                width: 450,
                child: _buildSignInForm(),
              ),
          ],
        ),
      ),
    ));
  }

  _buildAccount() {
    return ListTile(
      textColor: _auth == Auth.signup
          ? GlobalVaraible.backgroundColor
          : GlobalVaraible.greyBackgroundCOlor,
      title: const Text('Create Account '),
      leading: Radio(
          activeColor: GlobalVaraible.secondaryColor,
          value: Auth.signup,
          groupValue: _auth,
          onChanged: (Auth? val) {
            setState(() {
              _auth = val!;
            });
          }),
    );
  }

  _buildSignupFormKey() {
    return Form(
        key: _signupFromKey,
        child: Column(
          children: [
            CustomTextField(controller: _nameController, hintText: "Name", keyBordType: TextInputType.name,),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(controller: _emailController, hintText: "Email", keyBordType: TextInputType.emailAddress,),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(controller: _passController, hintText: "Password", keyBordType: TextInputType.phone,),
            const SizedBox(
              height: 20,
            ),
            CustomButton(text: 'Register', icon: Icons.person, onTap: () {}),
          ],
        ));
  }

  _buildSignInForm() {
    return Form(
        key: _signupFromKey,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomTextField(controller: _emailController, hintText: "Email", keyBordType: TextInputType.emailAddress,),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(controller: _passController, hintText: "Password", keyBordType: TextInputType.phone,),
            const SizedBox(
              height: 20,
            ),
            CustomButton(text: 'Login', icon: Icons.person, onTap: () {}),
          ],
        ));
  }

  _buildSignIn() {
    return ListTile(
      textColor: _auth == Auth.signIn
          ? GlobalVaraible.backgroundColor
          : GlobalVaraible.greyBackgroundCOlor,
      title: const Text(' Account sign-in'),
      leading: Radio(
          activeColor: GlobalVaraible.secondaryColor,
          value: Auth.signIn,
          groupValue: _auth,
          onChanged: (Auth? val) {
            setState(() {
              _auth = val!;
            });
          }),
    );
  }
}
