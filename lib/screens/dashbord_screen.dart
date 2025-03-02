import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/screens/bio_screen.dart';
import 'package:globalchat/screens/profile_screen.dart';
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
        title: Text('GlobalChat'),
      ),
      drawer: Drawer(
        child: Container(
         
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ListTile(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) {
                    return SplashScreen();
                  }), (route) {
                    return false;
                  });
                },
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfileScreen();
                  }));
                },
                leading: Icon(Icons.people),
                title: Text('Profile'),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BioScreen();
                  }));
                },
                leading: Icon(Icons.info),
                title: Text('Bio'),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Text('welcome'),
          Text((user?.email ?? '').toString()),
        ],
      ),
    );
  }
}
