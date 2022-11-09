import 'package:flut_fire/screens/authenticate/register.dart';
import 'package:flut_fire/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showsignin = true;
  void toggleView(){
    setState(() => showsignin = !showsignin,);
  }

  @override
  Widget build(BuildContext context) {
    if(showsignin){
      return SignIn(toggleView:toggleView);
    }else{
      return Register(toggleView:toggleView);
    }
  }
}