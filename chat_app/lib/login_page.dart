import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Let\'s Sign You In',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
            Text(
              'Welcome Back! \nYou\'ve been missed',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            ),
            Image(
                image: NetworkImage(
                    'https://media.licdn.com/dms/image/v2/D4E03AQGeuFgUOcH2BA/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1719344633781?e=1729728000&v=beta&t=vZVg_ajzOYWb_rsTas5cU-r-AzANcQ-LhI-MFAZmRIw')),
          ],
        ),
      ),
    );
  }
}
