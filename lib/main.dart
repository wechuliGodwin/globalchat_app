import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/firebase_options.dart';
import 'package:globalchat/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //ensure that flutter is complitly initialized b4 firebase is iniitialised
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
          fontFamily: "Poppins"),
      home: SplashScreen()
    );
  }
}
