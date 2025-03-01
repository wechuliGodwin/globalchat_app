import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/dashbord_screen.dart';
import 'package:globalchat/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // we can use use this variable to conditionaly forwarding the user to pages
  var user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    //check for user login status
    Future.delayed(Duration(seconds: 2), () {
      if (user == null) {
        openLogin();
      } else {
        openDashboard();
      }
    });
    super.initState();
  }

  void openDashboard() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return DashbordScreen();
    }));
  }

  void openLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/logo.png')),
    );
  }
}
