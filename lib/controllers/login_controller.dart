import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/dashbord_screen.dart';

class LoginController {
  static Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //pushAndRemoveUntil makes the opened screen the main screen
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return DashbordScreen();
      }), (route) {
        return false;
      });
    } catch (e) {
      //snackbar creates pop up at the bottom to alert user
      SnackBar messageSnackBar = SnackBar(
          backgroundColor: Colors.red[500], content: Text(e.toString()));

      ScaffoldMessenger.of(context).showSnackBar(messageSnackBar);
      print(e);
    }
  }
}
