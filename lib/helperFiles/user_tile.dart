import 'package:flutter/material.dart';
import 'package:project_djinn/services/info.dart';

class InfoTile extends StatelessWidget {
  InfoTile({Key? key, required this.info}) : super(key: key);

  final Info info;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(),
        ),
      ),
    );
  }
}
