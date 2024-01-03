import 'package:clickncart/views/buyers/auth/register_screen.dart';
import 'package:flutter/material.dart';

import '../main_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  _loginUsers() async {
    // Your existing login logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login Customer\'s account',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Email ID ';
                        } else {
                          return null;
                        }
                      },
                      onChanged: ((value) {
                        email = value;
                      }),
                      decoration: InputDecoration(
                        labelText: 'Enter Email Address,',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.email, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Password ';
                        } else {
                          return null;
                        }
                      },
                      onChanged: ((value) {
                        password = value;
                      }),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Enter password',
                        labelStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.lock, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      _loginUsers();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          // Keep your existing navigation logic
                          return MainScreen();
                        }),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.shade700,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            letterSpacing: 5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Need an account'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            // Keep your existing navigation logic
                            return RegisterScreen();
                          }));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                            fontSize: 20,
                          ),
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
    );
  }
}
