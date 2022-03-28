import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Sign up page'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(195.0, 0.0, 195.0, 0.0),
            child: Row(
              children: const [
                Expanded(child: textInputBox(label: 'First Name', isPassword: false, boxSize: [5.0, 5.0, 5.0, 5.0])),
                Expanded(child: textInputBox(label: 'Last Name', isPassword: false, boxSize: [5.0, 5.0, 5.0, 5.0])),
              ],
            ),
          ),
          const textInputBox(label: 'Username', isPassword: false, boxSize: [200.0,5.0,200.0,5.0]),
          const textInputBox(label: 'Email', isPassword: false, boxSize: [200.0,5.0,200.0,5.0]),
          const textInputBox(label: 'Password', isPassword: true, boxSize: [200.0,5.0,200.0,5.0]),
          const textInputBox(label: 'Confirm Password', isPassword: true, boxSize: [200.0,5.0,200.0,5.0]),
          const textInputBox(label: 'Phone Number', isPassword: false, boxSize: [200.0,5.0,200.0,5.0]),
          const MaterialButton(
              onPressed: doNothing,
              color: Colors.green,
              child: Text('Submit', style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
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