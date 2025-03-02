import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/dashbord_screen.dart';

class SignupController {
  static Future<void> createAccount({
    required BuildContext context,
    required String name,
    required String country,
    required String bio,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var userId =
          FirebaseAuth.instance.currentUser!.uid; //gets the current signup user

      var db = FirebaseFirestore.instance; //gets instance of the db

      Map<String, dynamic> data = {
        //constaract data
        'name': name,
        'country': country,
        'bio': bio,
        'email': email,
        'id': userId,
      };
      try {
        await db.collection('users').doc(userId.toString()).set(
            data); //save data in the users table inside the user document and  .set adds data to that document.and the data is a map/list
      } catch (e) {
        print(e);
      }

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
