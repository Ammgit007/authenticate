import 'package:flut_fire/services/auth.dart';
import 'package:flut_fire/shared/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth =AuthService();
  final _formkey = GlobalKey<FormState>();

  String email ='';
  String password = '';
  String error = '';
  bool _ot = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text('Register'),
         actions: [
          TextButton.icon(onPressed:() {
            widget.toggleView();
          } , 
          label: Text('Sign in'),
          icon: Icon(Icons.person),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child:Form(
          key: _formkey,
          child: Column(
          children: [
            SizedBox(height:20),
            TextFormField(
              decoration: textinputdecoration.copyWith(hintText: 'Email',),
              keyboardType: TextInputType.emailAddress,
              validator:(value) {
                if (value!.isEmpty ||!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}').hasMatch(value)){
                  return 'enter correct email';
                }else{
                  return null;
                }
              },
              onChanged: (value) { 
                setState(() {
                  email = value.trim();
                });
              },
            ),
            SizedBox(height:20),
            TextFormField(
              decoration: textinputdecoration.copyWith(hintText: 'Password',
              suffixIcon: GestureDetector(onTap: () {
                setState(() {
                  _ot=!_ot;
                });
              },
              child: Icon(_ot?Icons.visibility:Icons.visibility_off),
              )),
              validator: (value) => value!.length<6 ? 'Enter a valid password of 6+ characters' : null,
              obscureText: _ot,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 241, 78, 66),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
             onPressed: ()async{
              if(_formkey.currentState!.validate()){
              Future<dynamic> result = _auth.registerWithEP(email, password);}
             },
             child: Text('Register',
             style: TextStyle(color: Colors.white),)),
             
          ],
        )) ,
      ),
    );

  }
}