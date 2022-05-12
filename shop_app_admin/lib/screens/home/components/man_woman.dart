import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_admin/models/Product.dart';
import 'package:shop_app_admin/screens/authenticate/auth.dart';
import 'package:shop_app_admin/screens/details/components/formScreen.dart';
import 'package:shop_app_admin/screens/home/components/man_woman_body.dart';
import 'package:shop_app_admin/service/database.dart';
import 'package:shop_app_admin/shared/constant.dart';
import 'package:shop_app_admin/constants.dart';

class Man_Woman extends StatefulWidget {
  
  @override
  _Man_WomanState createState() => _Man_WomanState();
}

class _Man_WomanState extends State<Man_Woman> {

  String collectionName = 'upper';
  final Authservices _auth = Authservices();
    
  void changeCollection(String name){
    setState(() =>  collectionName = name);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: StreamProvider<List<Product>>.value(
        value: DatabaseService(uid: collectionName).product,
        child: Man_Woman_Body(changeCollection: changeCollection),
      ),
      drawer: Container(
        width: 200,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Image(image: AssetImage("assets/images/bag/bag_1.png")),
              ),
              ListTile(
                title: Text('Setting'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => FormScreen(product: null,)
                    )
                  );
                }, 
                icon: Icon(
                  Icons.add,
                  color: kTextColor,
                ),
                label: Text(
                  "Add-Product",
                  style: TextStyle(color: kTextColor, ),
                )
              ),
              FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                }, 
                icon: Icon(
                  Icons.person,
                  color: kTextColor,
                ),
                label: Text(
                  "Sign-Out",
                  style: TextStyle(color: kTextColor, ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}