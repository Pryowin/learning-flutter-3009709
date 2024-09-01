import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
  final _mainURL = 'https://dmburke.info';

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
      Image.asset(
        'assets/8bir9dlh.png',
        height: 200,
      ),
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
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w300))),
            Container(
              margin: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () async {
                  if (!await launchUrlString(_mainURL)) {
                    throw 'Could not launch web browser';
                  }
                },
                child: Column(
                  children: [
                    const Text('Find us on'),
                    Text(_mainURL),
                  ],
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaButton.linkedin(
                    url: "https://www.linkedin.com/in/davidmartinburke/"),
                SocialMediaButton.github(url: 'https://github.com/Pryowin')
              ],
            ),
          ]))
    ])));
  }
}
