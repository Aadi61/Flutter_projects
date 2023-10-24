import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
FirebaseAuth auth=  FirebaseAuth.instance;

class AuthController{
   UserCredential? userCredential;
    var emailController = TextEditingController();
  var passwordController = TextEditingController();
Future<UserCredential> loginMethod({context}) async {
   

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      SnackBar(content: Text(e.toString()));
    }
    return userCredential!;
  }

}


