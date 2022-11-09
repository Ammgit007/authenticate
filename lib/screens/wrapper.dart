import 'package:firebase_auth/firebase_auth.dart';
import 'package:flut_fire/models/user.dart';
import 'package:flut_fire/screens/authenticate/authenticate.dart';
import 'package:flut_fire/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Myuser?>(context);
  
    //return home or authenticate
    if(user== null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}