import 'package:clickncart/views/buyers/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:clickncart/controllers/auth_controller.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final AuthController _authController = AuthController();
  late String fullName = '';
  late String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    String? userFullName = await _authController.getUserFullName();
    String? userPhoneNumber = await _authController.getUserPhoneNumber();

    setState(() {
      fullName = userFullName ?? 'N/A';
      phoneNumber = userPhoneNumber ?? 'N/A';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          IconButton(
            onPressed: () {
              // Log out logic
              _authController.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) {
                  return RegisterScreen();
                }),
              );
            },
            icon: Icon(Icons.exit_to_app),

          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Profile Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text(
                        'Full Name:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        fullName,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Phone Number:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        phoneNumber,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Add more cards or widgets for additional sections of the account screen
          ],
        ),
      ),
    );
  }
}
