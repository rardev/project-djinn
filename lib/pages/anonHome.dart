import 'package:flutter/material.dart';
import 'package:project_djinn/services/auth.dart';

class AnonHome extends StatefulWidget
{
  const AnonHome({Key? key}) : super(key: key);

  @override
  State<AnonHome> createState() => _AnonHomeState();
}

class _AnonHomeState extends State<AnonHome> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const IconButton(
          onPressed: doNothing,
          icon: Icon(Icons.train),
          color: Colors.black,
        ),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 5.0, 10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/logIn');
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.red
              ),
              child: const Text('Log in'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signUp');
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey
              ),
              child: const Text('Sign up', style: TextStyle(color: Colors.black), ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
              child: const Text(
                'Start Planning for',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                ),
              ),
            ),
            const Text(
              'Your Birthday',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void doNothing()
{

}