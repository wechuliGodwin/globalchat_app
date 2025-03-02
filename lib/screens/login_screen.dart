import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/controllers/login_controller.dart';
import 'package:globalchat/controllers/signup_controller.dart';
import 'package:globalchat/screens/dashbord_screen.dart';
import 'package:globalchat/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //create a key to validate the form

  var userForm = GlobalKey<FormState>();
  //controllers to get data from the text field
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // function to create account refactored to signup_controller.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login '),
      // ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: userForm,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      SizedBox(
                          height: 150, child: Image.asset('assets/images/logo.png')),
                      // we use a text form field inorder to acess the validator
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Email is required";
                          }
                        },
                        decoration: InputDecoration(label: Text('Email')),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: password,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                          },
                          decoration: InputDecoration(label: Text('Password'))),
                      SizedBox(
                        height: 23,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.green[800]),
                              onPressed: () {
                                if (userForm.currentState!.validate()) {
                                  // create account
                                  LoginController.login(
                                      context: context,
                                      email: email.text,
                                      password: password.text);
                                }
                              },
                              child: Text('Login'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Row(
                        children: [
                          Text('Dont have an account?'),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            child: Text(
                              'Signup here!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[800]),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignupScreen();
                              }));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
