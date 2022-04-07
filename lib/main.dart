import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project_djinn/pages/wrapper.dart';
import 'package:project_djinn/services/auth.dart';
import 'package:project_djinn/services/user.dart';
import 'package:provider/provider.dart';
import 'package:project_djinn/splash.dart';
import 'package:project_djinn/pages/home.dart';
import 'package:project_djinn/pages/logIn.dart';
import 'package:project_djinn/pages/signUp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyAaZsAzN0C7wl0KKAw-LtaAjmWcDMGpaAk",
            appId: "1:410466408923:web:bc79bbd631a39ac17aaffe",
            messagingSenderId: "410466408923",
            projectId: "djinn-639dd",
          )
      ),//_initialization,
      builder: (context, snapshot)
      {
        if(snapshot.hasError)
          {
            print('Error');
          }
        if(snapshot.connectionState == ConnectionState.done)
          {
            return menu();
          }
        return const CircularProgressIndicator();
      },
    );
  }
}

class menu extends StatefulWidget {
  menu({Key? key}) : super(key: key);

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        themeMode: ThemeMode.dark,
        //initialRoute: '/',
        routes: {
          '/': (context) => const Splash(),
          '/home:': (context) => const Home(),
          '/signUp': (context) => const signUp(),
          '/logIn': (context) => const logIn(),
          '/wrapper': (context) => const Wrapper(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
