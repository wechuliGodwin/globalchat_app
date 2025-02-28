import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/splash_screen.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
//variable for getting firebase aouth instance
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          Text('welcome'),
          Text((user?.email ?? '').toString()),
          ElevatedButton(
              onPressed: () async {
               await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(context,
                    MaterialPageRoute(builder: (context) {
                  return SplashScreen();
                }), (route) {
                  return false;
                });
              },
              child: Text('Signout'))
        ],
      ),
    );
  }
}
