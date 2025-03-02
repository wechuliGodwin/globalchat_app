import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //use map bcoz the data is in key value pair
  Map<String, dynamic>? userData =
      {}; //? means a null or an object(an optional variable)
  var authUser = FirebaseAuth.instance.currentUser; // get user by id
  var db = FirebaseFirestore.instance; //instance of db

  void getData() {
    //geting data from the users collection then get document id  which is firebase users authentication id, .get gets the data, in order to use data we use  .then which will have call back func which takes a value(dataSnapshot) which stores the data in the map object
    db.collection('users').doc(authUser!.uid).get().then((dataSnapshiot) {
      userData = dataSnapshiot.data();
      setState(() {}); //notfy state about data stored in userData
    });
  }

  @override
  //called when we access the page is renderd
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Text(userData?['name'] ?? ''),
          Text(userData?['country'] ?? ''),
          Text(userData?['email'] ?? ''),
        ],
      ),
    );
  }
}
