import 'package:flutter/material.dart';

import 'package:chat_app/utils/textfield_styles.dart';
import 'widgets/login_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: userNameController.text);
      print('login successful');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Let\'s Sign You In',
          style: TextStyle(
              fontSize: 30,
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5)),
      const Text(
        'Welcome Back! \nYou\'ve been missed',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20,
            color: Colors.brown,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      ),
      const Image(
          image: NetworkImage(
              'https://media.licdn.com/dms/image/v2/D4E03AQGeuFgUOcH2BA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1719344633781?e=1729728000&v=beta&t=vZVg_ajzOYWb_rsTas5cU-r-AzANcQ-LhI-MFAZmRIw')),
      Form(
          key: _formkey,
          child: Column(children: [
            LoginTextfield(
              controller: userNameController,
              hintText: 'Enter your email address',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email must be provided";
                }
                if (value.length < 6 ||
                    !value.contains('@') ||
                    !value.contains('.')) {
                  return "Invalid email address";
                }
                return null;
              },
            ),
            LoginTextfield(
              controller: passwordController,
              hintText: "Enter your password",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password must be provided";
                }
                if (value.length < 8 || value.length > 20) {
                  return "Password must be between 8 and 20 characters in length.";
                }
                return null;
              },
              hideText: true,
            ),
            ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade50),
                child: const Text('Login',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w300)))
          ]))
    ])));
  }
}
