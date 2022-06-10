import 'package:flutter/material.dart';

var focusNode = FocusNode();

class textInputBox extends StatefulWidget
{
  final String label;
  final bool isPassword;
  final List boxSize;
  final dynamic borderStyle;
  final double width;

  const textInputBox({Key? key, required this.label, required this.isPassword, required this.boxSize, required this.borderStyle, required this.width}) : super(key: key);

  @override
  State<textInputBox> createState() => _textInputBoxState();
}

class _textInputBoxState extends State<textInputBox> {
  final textController = TextEditingController();

  String parameter = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: maxSize(context, widget.width/*500.0*/),
        child: Padding(
          padding: EdgeInsets.fromLTRB(widget.boxSize[0], widget.boxSize[1], widget.boxSize[2], widget.boxSize[3]),
          child: TextFormField(
            validator: (val) => val!.isEmpty ? 'Enter ${widget.label}' : null,
            onChanged: (val){
              setState(() => parameter = val);
              store.set(widget.label, parameter);
            },
            onFieldSubmitted: (value){
              FocusScope.of(context).requestFocus(focusNode);
            },
            controller: textController,
            obscureText: widget.isPassword,
            decoration: InputDecoration(
                hintText: widget.label,
                border: widget.borderStyle,//null,//const OutlineInputBorder(),
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
