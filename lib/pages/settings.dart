import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(child: Text("Settings")),
      ),
      body: Column(
        children: [
          const Text("Theme"),
          Container(
            color: Colors.black12,
              child: FittedBox(

              )
          ),
        ],
      ),
    );
  }
}
