import 'package:flutter/material.dart';
import 'package:users_reg/home.dart';
import 'package:users_reg/login.dart';
import 'package:users_reg/signup.dart';

void main() => runApp(TC());

class TC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup' :(context) => SignupPage(),
      },
    );
  }
}