import 'package:flut_fire/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final AuthService _auth =AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0,
          title: Text('App'),
          actions: [
            TextButton.icon(onPressed: ()async {
             await _auth.signOut();
            }, 
            icon: Icon(Icons.person,color: Colors.black,), 
            label: Text('LogOUT',
            style: TextStyle(color: Colors.black),)
            )
          ],
        ),
        body: Center(child: Text('Welcome to App',style:TextStyle(fontSize: 30))),
      ),
    );
  }
}