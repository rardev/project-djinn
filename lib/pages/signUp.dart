import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_djinn/services/auth.dart';
import 'package:project_djinn/helperFiles/loading.dart';
import 'package:project_djinn/services/database.dart';
import 'package:project_djinn/helperFiles/forms.dart';


class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {

  final textController = TextEditingController();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String error = '';

  void submit() async
  {
    if(_formKey.currentState!.validate())
    {
      setState(() => loading = true);
      dynamic result = await _auth.registerEmailAndPassword(store.get('Email'), store.get('Password'));
      if(result == null)
      {
        setState(() {
          error = 'could not create account';
          loading = false;
        });
      }
      else
      {
        await DatabaseService(uid: result!.uid).updateUserData(store.get('First Name'), store.get('Last Name'), store.get('Username'), store.get('Phone Number'));
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
          backgroundColor: Colors.grey,
          title: const Text('Sign up page'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: maxSize(context, 500.0),
                  child: Row(
                    children: const [
                      Expanded(child: textInputBox(label: 'First Name', isPassword: false, boxSize: [0.0, 10.0, 5.0, 5.0])),
                      Expanded(child: textInputBox(label: 'Last Name', isPassword: false, boxSize: [5.0, 10.0, 0.0, 5.0])),
                    ],
                  ),
                ),
                const textInputBox(label: 'Username', isPassword: false, boxSize: [0.0,5.0,0.0,5.0]),
                const textInputBox(label: 'Email', isPassword: false, boxSize: [0.0,5.0,0.0,5.0]),
                const textInputBox(label: 'Password', isPassword: true, boxSize: [0.0,5.0,0.0,5.0]),
                const textInputBox(label: 'Confirm Password', isPassword: true, boxSize: [0.0,5.0,0.0,5.0]),
                const textInputBox(label: 'Phone Number', isPassword: false, boxSize: [0.0,5.0,0.0,5.0]),
                MaterialButton(
                    onPressed: () async => submit(),
                    color: Colors.green,
                    child: const Text('Submit', style: TextStyle(color: Colors.white),),
                ),
                const SizedBox(height: 12.0,),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}