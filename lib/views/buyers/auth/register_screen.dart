import 'package:flutter/material.dart';
import 'package:clickncart/controllers/auth_controller.dart';
import 'package:clickncart/utils/show_snackBar.dart';
import 'package:clickncart/views/buyers/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = AuthController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email;
  late String fullName;
  late String phoneNumber;
  late String password;
  bool _isLoading = false;

  void _signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      await _authController
          .signUpUsers(email, fullName, phoneNumber, password)
          .whenComplete(() {
        setState(() {
          _formKey.currentState!.reset();
          _isLoading = false;
        });
      });

      showSnack(context, 'Congratulations Registered Successfully');
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnack(context, 'Fields must not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF77D8D8), Color(0xFFF7F7F7)], // Green and Off-white gradient
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildHeading(),
                  const SizedBox(height: 20),
                  _buildInputField(
                    label: 'Enter email',
                    icon: Icons.email,
                    onChanged: (value) => email = value,
                    validator: (value) => value!.isEmpty ? 'Please Enter Email' : null,
                  ),
                  _buildInputField(
                    label: 'Enter Full name',
                    icon: Icons.person,
                    onChanged: (value) => fullName = value,
                    validator: (value) => value!.isEmpty ? 'Please Enter Full Name' : null,
                  ),
                  _buildInputField(
                    label: 'Enter Phone no',
                    icon: Icons.phone,
                    onChanged: (value) => phoneNumber = value,
                    validator: (value) => value!.isEmpty ? 'Please Enter Phone Number' : null,
                  ),
                  _buildInputField(
                    label: 'Enter Password',
                    icon: Icons.lock,
                    obscureText: true,
                    onChanged: (value) => password = value,
                    validator: (value) => value!.isEmpty ? 'Please Enter Password' : null,
                  ),
                  const SizedBox(height: 20),
                  _buildRegisterButton(),
                  const SizedBox(height: 10),
                  _buildLoginLink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return Text(
      'Create Customer\'s account',
      style: TextStyle(
        fontSize: 25,
        color: Colors.black, // Black text color
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    required Function(String) onChanged,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        style: TextStyle(color: Colors.black), // Black text color
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black), // Black label color
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Black border color
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black), // Black focused border color
          ),
          prefixIcon: Icon(icon, color: Colors.black), // Black prefix icon color
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: _signUpUser,
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black, // Black button color
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: _isLoading
                ? CircularProgressIndicator(
              color: Color(0xFF77D8D8), // Green loading indicator color
            )
                : Text(
              'Register',
              style: TextStyle(
                color: Color(0xFF77D8D8), // Green text color
                fontSize: 19,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already Have an Account?   ',
          style: TextStyle(color: Colors.black), // Black text color
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }));
          },
          child: Text(
            'Login',
            style: TextStyle(
              color: Color(0xFF77D8D8), // Green text color
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
