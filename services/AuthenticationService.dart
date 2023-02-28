import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginfirebase/DatabaseManager/DatabaseManager.dart';

class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Registration with EMail and Password

  Future createNewUser(String name,String email, String password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DatabaseManager().createUserData(name, "Male", 500, user!.uid);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  // Signin with email and password

  Future loginUser(String email, String password) async{
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
    }
  }

  //signout

  Future SignOut() async{
    try {
      _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}