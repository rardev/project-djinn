import 'package:flutter/material.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Login Screen'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const Text('Log in page'),
    );
  }
}