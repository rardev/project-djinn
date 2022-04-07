import 'package:flutter/material.dart';
import 'package:project_djinn/services/auth.dart';
import 'package:project_djinn/services/database.dart';
import 'package:project_djinn/services/user.dart';
import 'package:provider/provider.dart';
import 'package:project_djinn/helperFiles/userList.dart';
import 'package:project_djinn/services/info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection('users');//.doc();
final GlobalState store = GlobalState.instance;

class Home extends StatefulWidget
{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();
  late CustomUser user = Provider.of<CustomUser?>(context)!;
  late Info info = Info(first_name: '#', last_name: 'B', username: 'C', phone_number: 'D');

  @override
  void initState() {
    // TODO: implement initState
    //await DatabaseService(uid: );
    super.initState();
    //user = Provider.of<CustomUser?>(context)!;
    Future.delayed(Duration.zero, () {
     _getUserById(user.uid);
    });
  }


  Future<void> _getUserById(String id) async{
    final DocumentSnapshot doc = await usersRef.doc(id).get();
    setState(() {
      info = Info(first_name: doc.get('first_name'), last_name: doc.get('last_name'), username: doc.get('username'), phone_number: doc.get('phone_number'));
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return StreamProvider<List<Info>>.value(
      value: DatabaseService(uid: user.uid).users,
      initialData: [],
      child: Scaffold(
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
                onPressed: () async {
                  await _auth.singOut();
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.red
                ),
                child: const Text('Logout'),
              ),
            ),
            /*
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
             */
          ],
          /*flexibleSpace: SafeArea(
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
          ),*/
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          //color: Colors.white,
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //UserList(),
                UserInfo(category: 'First Name: ', data: info.first_name),
                UserInfo(category: 'Last Name: ', data: info.last_name),
                UserInfo(category: 'Username: ', data: info.username),
                UserInfo(category: 'Phone Number: ', data: info.phone_number),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  
  final String category;
  final String data;
  
  const UserInfo({Key? key, required this.category, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //width: 200.0,
        //color: Colors.black,
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0.0,10.0,0.0),
                child: Text(
                  category,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.cyanAccent,
                  ),
                ),
              ),
              Text(
                data,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.pink,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class GlobalState
{
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) => _data[key];
}



void doNothing()
{

}