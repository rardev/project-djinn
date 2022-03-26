import 'package:flutter/material.dart';

class Home extends StatefulWidget
{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        flexibleSpace: SafeArea(
          child: Container(
            color: Colors.deepPurple[300],
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const IconButton(
                  onPressed: doNothing,
                  icon: Icon(Icons.train),
                  color: Colors.black,
                ),
                Spacer(),
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
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
                Container(
                  margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
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
          ),
        ),
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