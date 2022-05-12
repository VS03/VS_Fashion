import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'screens/authenticate/authenticate.dart';
import 'screens/home/components/man_woman.dart';


class Wrapper extends StatefulWidget {
  
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {

    String collectionName = 'upper';
    
    void changeCollection(String name){
      setState(() =>  collectionName = name);
    }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
  
    if(user == null)  return Authenticate();
    else
    return Man_Woman();
  }
}