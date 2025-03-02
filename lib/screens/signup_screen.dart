import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/controllers/signup_controller.dart';
import 'package:globalchat/screens/dashbord_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //create a key to validate the form

  var userForm = GlobalKey<FormState>();
  //controllers to get data from the text field
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController password = TextEditingController();

  // function to create account refactored to signup_controller.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: userForm,
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 150,
                          child: Image.asset('assets/images/logo.png')),
                      // we use a text form field inorder to acess the validator
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is required";
                          }
                        },
                        decoration: InputDecoration(label: Text('Name')),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: country,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Country is required";
                          }
                        },
                        decoration: InputDecoration(label: Text('country')),
                      ),
                      SizedBox(
                        height: 23,
                      ),
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

                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: bio,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Bio is required";
                          }
                        },
                        decoration: InputDecoration(label: Text('Bio')),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(0, 50),
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.green[800]),
                              onPressed: () {
                                if (userForm.currentState!.validate()) {
                                  // create account
                                  SignupController.createAccount(
                                    context: context,
                                    name: name.text,
                                    country: country.text,
                                    email: email.text,
                                    password: password.text,
                                    bio: bio.text,
                                  );
                                }
                              },
                              child: Text('Create account'),
                            ),
                          ),
                        ],
                      ),
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
