import 'package:flutter/cupertino.dart';
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
            textInputBox(
                label: 'Username',
                isPassword: false,
                boxSize: [0.0, 5.0, 0.0, 5.0]),
            textInputBox(
                label: 'Password',
                isPassword: true,
                boxSize: [0.0, 5.0, 0.0, 5.0]),
            MaterialButton(
              onPressed: doNothing,
              color: Colors.green,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ));
  }
}

class textInputBox extends StatefulWidget {
  final String label;
  final bool isPassword;
  final List boxSize;
  //final BoxSize boxSize;
  const textInputBox(
      {Key? key,
      required this.label,
      required this.isPassword,
      required this.boxSize})
      : super(key: key);

  @override
  State<textInputBox> createState() => _textInputBoxState();
}

class _textInputBoxState extends State<textInputBox> {
  final textController = TextEditingController();
  //final double left = 200.0;
  //List box = ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: maxSize(context, 500.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(widget.boxSize[0], widget.boxSize[1], widget.boxSize[2], widget.boxSize[3]),
          child: TextField(
            controller: textController,
            obscureText: widget.isPassword,
            //expands: true,
            //cursorWidth: 10.0,
            //cursorColor: Colors.amber,
            decoration: InputDecoration(
                hintText: widget.label,
                //contentPadding: const EdgeInsets.fromLTRB(-20.0, 20.0, -20.0, 20.0),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    textController.clear();
                  },
                  icon: const Icon(Icons.clear),
                )),
          ),
        ),
      ),
    );
  }
}

void doNothing() {}

double maxSize(BuildContext context, double max)
{
  double width = MediaQuery.of(context).size.width;
  if(width > max) {
    return max;
  }
  return width;
}
