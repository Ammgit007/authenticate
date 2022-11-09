import 'package:firebase_auth/firebase_auth.dart';
import 'package:flut_fire/models/user.dart';
import 'package:flut_fire/services/database.dart';

class AuthService{

  final FirebaseAuth _auth  = FirebaseAuth.instance;

  //create user obj
  Myuser? _userfromfirebse (User? user){
    return user != null ? Myuser(uid: user.uid) : null;
  }

  //auth chaange user stream
  Stream<Myuser?> get user{
    return _auth.authStateChanges()
    //map((User? user) => _userfromfirebse(user));
    .map(_userfromfirebse);
  }

  //sign in anonymously
  Future signInAnon() async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userfromfirebse(user);
    }catch(e){
      print(e.toString());
      return null;
    }

  }

  //sign in with email and pass
  Future signInWithEP(String email, String password)async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userfromfirebse(user);

    }catch(e){
      print(e.toString());
      return null;

    }
  }

  //register with email and pass
  Future registerWithEP(String email, String password)async{
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      print(user);
      await Databaseservice(uid: user!.uid).UpdateUserData('0','new crew member',100);
      return _userfromfirebse(user);

    }catch(error){
      print(error.toString());
      return null;

    }
  }

  //sign out
  Future signOut()async{
    try{
     return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}

