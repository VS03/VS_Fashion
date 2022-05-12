import 'package:flutter/material.dart';
import 'package:shop_app_admin/screens/authenticate/auth.dart';
import 'package:shop_app_admin/shared/constant.dart';
import 'package:shop_app_admin/shared/loading.dart';



class Signin extends StatefulWidget {
  
  final Function toggleView;

  Signin({this.toggleView});
  
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

  final Authservices _auth = Authservices();
  String email='',password='',error='';

  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        elevation: 0.0,
        title: Text("Sign-In"),
        actions: <Widget>[
          FlatButton.icon(
            color: Colors.blueGrey[400],
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text(
              "Sign-Up", 
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
          padding: EdgeInsets.fromLTRB(50, 150, 50, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // Container(
                //   height: 100,
                //   child: Image(
                //     image: AppLogo will be here when its designed
                //   )
                // ),
                SizedBox(height: 10.0),
                TextFormField(
                  decoration: textInputStyle.copyWith(hintText: "Email"),
                  validator: (val) => val.isEmpty ? "Entar Email" : null,
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
                RaisedButton(
                  color: Colors.blueGrey[400],
                  child: Text("Sign-in"),
                  onPressed: () async {
                    if(_formKey.currentState.validate()){
                      setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() {
                          error = "Truble to SignIn try after sometime";
                          loading = false;
                        });
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