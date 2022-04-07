import 'package:flutter/material.dart';
import 'package:project_djinn/pages/home.dart';
import 'package:project_djinn/pages/anonHome.dart';
import 'package:project_djinn/services/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<CustomUser?>(context);

    if(user == null)
      {
        return AnonHome();
      }
    else
    {
      return Home();
    }
  }
}
