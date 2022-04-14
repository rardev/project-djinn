import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_djinn/services/auth.dart';
import 'package:project_djinn/helperFiles/loading.dart';

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
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text('Login Screen'),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Form(
          key: _formKey,
          child: RawKeyboardListener(
            focusNode: focusNode,
            onKey: (event) {
              if(event.isKeyPressed(LogicalKeyboardKey.enter))
              {
                print("enter key has been pressed");
                submit();
              }
            },
            child: Column(
              children: [
                const textInputBox(
                    label: 'Email',
                    isPassword: false,
                    boxSize: [0.0, 5.0, 0.0, 5.0]),
                const textInputBox(
                    label: 'Password',
                    isPassword: true,
                    boxSize: [0.0, 5.0, 0.0, 5.0]),
                MaterialButton(
                  onPressed: () async => submit(),/*() async{
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
                  },*/
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
          ),
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

  String parameter = '';
  //final double left = 200.0;
  //List box = ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: maxSize(context, 500.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(widget.boxSize[0], widget.boxSize[1], widget.boxSize[2], widget.boxSize[3]),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? 'Enter ${widget.label}' : null,
            onChanged: (val) {
              setState(() => parameter = val);
              store.set(widget.label, parameter);
            },
            //onFieldSubmitted: (value){
            //  print(widget.label);
            //},
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


class GlobalState
{
  final Map<dynamic, dynamic> _data = <dynamic, dynamic>{};

  static GlobalState instance = GlobalState._();
  GlobalState._();

  set(dynamic key, dynamic value) => _data[key] = value;
  get(dynamic key) => _data[key];
}

final GlobalState store = GlobalState.instance;
