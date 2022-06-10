import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_djinn/services/auth.dart';
import 'package:project_djinn/services/database.dart';
import 'package:project_djinn/services/user.dart';
import 'package:provider/provider.dart';
import 'package:project_djinn/services/info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_djinn/helperFiles/add_todo_button.dart';
import 'package:project_djinn/helperFiles/forms.dart';

final usersRef = FirebaseFirestore.instance.collection('users'); //.doc();
final GlobalState store = GlobalState.instance;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  late CustomUser user = Provider.of<CustomUser?>(context)!;
  late Info info =
      Info(first_name: '', last_name: '', username: '', phone_number: '', UID: '');

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

  Future<void> _getUserById(String id) async {
    final DocumentSnapshot doc = await usersRef.doc(id).get();
    setState(() {
      info = Info(
          first_name: doc.get('first_name'),
          last_name: doc.get('last_name'),
          username: doc.get('username'),
          phone_number: doc.get('phone_number'),
          UID: id);
      store.set("First Name", doc.get('first_name'));
      store.set("Last Name", doc.get('last_name'));
      store.set("Username", doc.get('username'));
      store.set("Phone Number", doc.get('phone_number'));
      store.set("UID", id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Info>>.value(
      value: DatabaseService(uid: user.uid).users,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#4D2799"),
          title: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: const Text('Search'),
              style: ElevatedButton.styleFrom(primary: HexColor("#683FB8"))),
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //UserList()
                UserInfo(category: 'First Name: ', data: store.get('First Name')/*info.first_name*/),
                UserInfo(category: 'Last Name: ', data: store.get('Last Name')/*info.last_name*/),
                UserInfo(category: 'Username: ', data: store.get('Username')/*info.username*/),
                UserInfo(category: 'Phone Number: ', data: store.get('Phone Number')/*info.phone_number*/),
                UserInfo(category: "UID: ", data: info.UID),
              ],
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: AddTodoButton(),
            )
          ],
        ),
        endDrawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: HexColor("#4D2799"),
              ),
              child: const Text('Drawer Header'),
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Create a list"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Logout"),
              onTap: () async {
                await _auth.signOut();
                Navigator.pop(context);
              },
              tileColor: Colors.red,
            ),
          ]),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String category;
  final String data;

  const UserInfo({Key? key, required this.category, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
            child: Text(
              category,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.cyanAccent,
              ),
            ),
          ),
          Text(
            data,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}

/*class GlobalState {
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) => _data[key];
}*/

void doNothing() {}
