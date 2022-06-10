import 'package:flutter/material.dart';
import 'hero_dialog_route.dart';
import 'package:project_djinn/helperFiles/forms.dart';
import 'package:project_djinn/services/database.dart';

/// {@template add_todo_button}
/// Button to add a new [Todo].
///
/// Opens a [HeroDialogRoute] of [_AddTodoPopupCard].
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}

DateTime datetime = DateTime.now();

void submit() async {
  // await DatabaseService(uid: store!.UID).updateListData(
  //lid, store.get('List Name'), store.get('List Description'), datetime);
}

class AddTodoButton extends StatelessWidget {
  /// {@macro add_todo_button}
  const AddTodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return _AddTodoPopupCard();
          }));
        },
        child: Hero(
          tag: _heroAddTodo,
          /*createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },*/
          child: Material(
            color: Colors.deepPurple, //Color of button
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add_rounded,
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}

/// Tag-value used for the add todo popup button.
const String _heroAddTodo = 'add-todo-hero';

/// {@template add_todo_popup_card}
/// Popup card to add a new [Todo]. Should be used in conjuction with
/// [HeroDialogRoute] to achieve the popup effect.
///
/// Uses a [Hero] with tag [_heroAddTodo].
/// {@endtemplate}
class _AddTodoPopupCard extends StatefulWidget {
  /// {@macro add_todo_popup_card}
  _AddTodoPopupCard({Key? key}) : super(key: key);

  @override
  State<_AddTodoPopupCard> createState() => _AddTodoPopupCardState();
}

class _AddTodoPopupCardState extends State<_AddTodoPopupCard> {
  //late final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool? _public = true;
  late String name = "Public";
  //int val = -1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          /*createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },*/
          child: Material(
            color: Colors.deepPurple, //Color of popup window
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const textInputBox(
                          label: 'List Title',
                          isPassword: false,
                          boxSize: [0.0, 0.0, 0.0, 0.0],
                          borderStyle: InputBorder.none,
                          width: 5000.0),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.2,
                      ),
                      const textInputBox(
                          label: 'Description',
                          isPassword: false,
                          boxSize: [0.0, 0.0, 0.0, 30.0],
                          borderStyle: InputBorder.none,
                          width: 5000.0),
                      const Divider(
                        color: Colors.white,
                        thickness: 0.2,
                      ),
                      Row(
                        children: [
                          //Text("This is a test"),
                          /*ElevatedButton(
                            onPressed: (){},
                            child: const Text("Public"),
                          ),*/
                          ElevatedButton(
                            onPressed: () {
                              _public = !_public!;
                              if (_public == true) {
                                name = "Public";
                              } else {
                                name = "Private";
                              }
                              setState(() {});
                            },
                            child: Text(name),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                            ),
                          ),
                          /*ListTile(
                            title: Text("Public"),
                            leading: Radio(
                              value: true,
                              groupValue: _public,
                              onChanged: (bool? value) {
                                setState(() {
                                  _public = value;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                          ),
                          ListTile(
                            title: Text("Private"),
                            leading: Radio(
                              value: false,
                              groupValue: _public,
                              onChanged: (bool? value) {
                                setState(() {
                                  _public = value;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                          )*/
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style:
                            ElevatedButton.styleFrom(primary: Colors.black12),
                        child: const Text('Create'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
