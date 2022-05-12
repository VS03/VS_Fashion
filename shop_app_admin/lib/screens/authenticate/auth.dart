import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app_admin/models/user.dart';
import 'package:shop_app_admin/service/database.dart';

class Authservices{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signUpWithEmailAndPassword(String email, String password, String number) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      
      await DatabaseService(uid: user.uid).upadetUserData(email, number);
      
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future signOut () async {
    try{
      return _auth.signOut();
    }
    catch(e){
      print(e);
      return null;
    }
  }
}