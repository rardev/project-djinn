import 'package:flutter/material.dart';
import 'package:project_djinn/services/auth.dart';
import 'package:project_djinn/helperFiles/loading.dart';
import 'package:project_djinn/services/database.dart';

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

  @override
  Widget build(BuildContext context) {
    return loading ? const Loading() : Scaffold(
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
                    //textInputBox(label: 'First Name', isPassword: false, boxSize: [0.0, 5.0, 5.0, 5.0]),
                    //textInputBox(label: 'Last Name', isPassword: false, boxSize: [5.0, 5.0, 0.0, 5.0])
                  ],
                ),
              ),
              const textInputBox(label: 'Username', isPassword: false, boxSize: [0.0,5.0,0.0,5.0]),
              const textInputBox(label: 'Email', isPassword: false, boxSize: [0.0,5.0,0.0,5.0]),
              const textInputBox(label: 'Password', isPassword: true, boxSize: [0.0,5.0,0.0,5.0]),
              const textInputBox(label: 'Confirm Password', isPassword: true, boxSize: [0.0,5.0,0.0,5.0]),
              const textInputBox(label: 'Phone Number', isPassword: false, boxSize: [0.0,5.0,0.0,5.0]),
              MaterialButton(
                  onPressed: () async {
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
                        //print(store.get('Email'));
                        //print(store.get('Password'));
                      }
                  },
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
            onChanged: (val){
              setState(() => parameter = val);
              store.set(widget.label, parameter);
            },
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
        ),
      ),
    );
  }
}

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

void doNothing()
{

}