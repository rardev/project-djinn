import 'package:flutter/material.dart';
import 'package:project_djinn/splash.dart';
import 'package:project_djinn/pages/home.dart';
import 'package:project_djinn/pages/logIn.dart';
import 'package:project_djinn/pages/signUp.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.dark,
    //initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/home:': (context) => Home(),
      '/signUp': (context) => signUp(),
      '/logIn': (context) => logIn(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
