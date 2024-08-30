import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatPage(),
          ));
      print('login successful');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
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
                        controller: userNameController,
                        decoration: const InputDecoration(
                            labelText: 'EMail Address',
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 400,
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password must be provided";
                          }
                          if (value.length < 8 || value.length > 20) {
                            return "Password must be between 8 and 20 characters in length.";
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade50),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                ))
          ],
        ),
      ),
    );
  }
}
