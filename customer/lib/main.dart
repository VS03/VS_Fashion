import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_admin/models/user.dart';
import 'package:shop_app_admin/screens/authenticate/auth.dart';
import 'package:shop_app_admin/wrapper.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<User>.value(
      value: Authservices().user,
      child: MaterialApp(
        routes: {
          '/chamgeForm': (context) => Wrapper(),
        },
        home: Wrapper(),
      ),
    );
  }
}