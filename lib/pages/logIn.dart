import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_djinn/services/auth.dart';
import 'package:project_djinn/helperFiles/loading.dart';
import 'package:project_djinn/helperFiles/forms.dart';


class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {

  late final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String error = '';

  void submit() async
  {
    if(_formKey.currentState!.validate())
    {
      setState(() => loading = true);
      dynamic result = await _auth.loginEmailAndPassword(store.get('Email'), store.get('Password'));
      if(result == null)
      {
        setState(() {
          error = 'could not sign in with those credentials';
          loading = false;
        });
      }
      else
      {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : RawKeyboardListener(
      autofocus: true,
      focusNode: focusNode,
      onKey: (event) {
        if(event.isKeyPressed(LogicalKeyboardKey.enter))
        {
          print("enter key has been pressed");
          submit();
        }
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: const Text('Login Screen'),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                const textInputBox(
                    label: 'Email',
                    isPassword: false,
                    boxSize: [0.0, 5.0, 0.0, 5.0], borderStyle:OutlineInputBorder(), width: 500.0),
                const textInputBox(
                    label: 'Password',
                    isPassword: true,
                    boxSize: [0.0, 5.0, 0.0, 5.0], borderStyle:OutlineInputBorder(), width: 500.0),
                MaterialButton(
                  onPressed: () async => submit(),
                  color: Colors.green,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12.0,),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          )),
    );
  }
}
