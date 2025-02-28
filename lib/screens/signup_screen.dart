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
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // function to create account refactored to signup_controller.dart
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup '),
      ),
      body: Form(
        key: userForm,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
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
              ElevatedButton(
                onPressed: () {
                  if (userForm.currentState!.validate()) {
                    // create account
                    SignupController.createAccount(
                        context: context,
                        email: email.text,
                        password: password.text);
                  }
                },
                child: Text('Create account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
