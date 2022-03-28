import 'package:flutter/material.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Login Screen'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: const [
          textInputBox(label: 'Username', isPassword: false, boxSize: [200.0, 5.0, 200.0, 5.0]),
          textInputBox(label: 'Password', isPassword: false, boxSize: [200.0,5.0,200.0,5.0]),
          MaterialButton(
            onPressed: doNothing,
            color: Colors.green,
            child: Text('Submit', style: TextStyle(color: Colors.white),),
          ),
        ],
      )
    );
  }
}

class textInputBox extends StatefulWidget
{
  final String label;
  final bool isPassword;
  final List boxSize;
  //final BoxSize boxSize;
  const textInputBox({Key? key, required this.label, required this.isPassword, required this.boxSize}) : super(key: key);

  @override
  State<textInputBox> createState() => _textInputBoxState();
}

class _textInputBoxState extends State<textInputBox> {
  final textController = TextEditingController();
  //final double left = 200.0;
  //List box = ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.boxSize[0], widget.boxSize[1], widget.boxSize[2], widget.boxSize[3]),
      child: TextField(
        controller: textController,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
            hintText: widget.label,
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: (){
                textController.clear();
              },
              icon: const Icon(Icons.clear),
            )
        ),
      ),
    );
  }
}

void doNothing()
{

}