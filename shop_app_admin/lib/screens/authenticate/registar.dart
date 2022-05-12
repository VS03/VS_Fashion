
import 'package:flutter/material.dart';
import 'package:shop_app_admin/shared/constant.dart';
import 'package:shop_app_admin/shared/loading.dart';

import 'auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Authservices _auth = Authservices();
  String email="",password="",number='',error="";

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        elevation: 0.0,
        title: Text("Register"),
        actions: <Widget>[
          FlatButton.icon(
            color: Colors.blueGrey[400],
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              "Sign-In", 
              style: TextStyle(
                color: Colors.white
              ),
            ),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(50, 100, 50, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Container(
                //   height: 100,
                //   child: Image(
                //     image: AssetImage("assets/images/bag/bag_1.png")
                //   )
                // ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: textInputStyle.copyWith(hintText: "Email"),
                  validator: (val) => val.isEmpty ? "Enter Email" : null,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  obscureText: true,
                  decoration: textInputStyle.copyWith(hintText: "Password"),
                  validator: (val) => val.length < 6 ? "Enter atleast 6 digit password" : null,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: textInputStyle.copyWith(hintText: "Contact Number"),
                  validator: (val) => val.length != 10 ? "Enter Contact number" : null,
                  onChanged: (val){
                    setState(() {
                      number = val;
                    });
                  },
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  color: Colors.blueGrey[400],
                  child: Text("Sign-up"),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signUpWithEmailAndPassword(email, password, number);
                      if(result == null){
                        try{
                            setState(() {
                              error = "Truble to register try after sometime";
                              loading = false;
                            });
                          }
                        catch(e){
                          print(e.toString());
                        }
                      }
                    }
                  },
                ),
                SizedBox(height: 10.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}