import 'package:flutter/material.dart';
import 'package:globalchat/screens/dashbord_screen.dart';
import 'package:globalchat/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //check for user login status
    Future.delayed(Duration(seconds: 2), () {
      openLogin();
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
      body: Text('splash'),
    );
  }
}
