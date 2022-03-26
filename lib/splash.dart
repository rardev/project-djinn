import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_djinn/pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _Splashstate createState() => _Splashstate();
}

class _Splashstate extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const Home(
                    //title: 'Home',
                  )));
    });
  }

// This widget handles the splash screen design
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: const Text(
        'Djinn',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ))),
    );
  }
}
