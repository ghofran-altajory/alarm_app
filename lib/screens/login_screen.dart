import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          //Image
          Image.asset(
            'assets/ss.png' , 
            height: 150,
          )
          
          //Title
          
          //sub title
          
          //user name
          
          //password
          
          //sign in
          
          //sign up
              
            ],),
        ),
      ),
    );
  }
}
