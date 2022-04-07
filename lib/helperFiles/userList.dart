import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_djinn/services/info.dart';

class UserList extends StatefulWidget {
  UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<Info>>(context);
    /*
    users.forEach((info) {
      print(info.first_name);
      print(info.last_name);
      print(info.username);
      print(info.phone_number);
    });
    */
    return Container();/*ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return
      },
    );*/
  }
}
