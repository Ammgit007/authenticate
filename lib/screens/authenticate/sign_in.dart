import 'package:flut_fire/screens/authenticate/register.dart';
import 'package:flut_fire/services/auth.dart';
import 'package:flut_fire/shared/constants.dart';
import 'package:flut_fire/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({required this.toggleView});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  
  String email ='';
  String password = '';
  String error = '';
  bool _ot = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text('Sign IN'),
        actions: [
          TextButton.icon(onPressed:() {
            widget.toggleView();
          } , 
          label: Text('Register'),
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
              validator:(value) {
                if (value!.isEmpty ||!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}').hasMatch(value)){
                  return 'enter correct email';
                }else{
                  return null;
                }
              },
              onChanged: (value) { 
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height:20),
            TextFormField(
              decoration: textinputdecoration.copyWith(hintText: 'Password',
              suffixIcon: GestureDetector(onTap: (() {
                setState(() {
                  _ot = !_ot;
                });
              }
              ),
              child: Icon(_ot ? Icons.visibility: Icons.visibility_off),
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
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 241, 78, 66),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
            child: Text('Sign in',
             style: TextStyle(color: Colors.white),),
             onPressed: ()async{
              if(_formkey.currentState!.validate()){
                setState(() {
                  loading = true;
                });
                dynamic result = await _auth.signInWithEP(email, password);
                if (result == null){
                  setState(()=> error = 'Could not sign in with these credentials wrong password or email Check again');
                  loading = false;
                }
              }

             },
             ),
             SizedBox(height: 20,),
             Text(error,
             style: TextStyle(fontSize: 14, color: Colors.red),)
          ],
        )),
      ),
    );
  }
}