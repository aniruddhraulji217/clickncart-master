import 'package:clickncart/views/buyers/auth/register_screen.dart';
import 'package:clickncart/views/buyers/main_screen.dart';
import 'package:clickncart/views/buyers/nav_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:clickncart/main.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
    void initState() {
    super.initState();
    _navigatehome();
  }

  _navigatehome() async {
    await Future.delayed(Duration(seconds: 3), ()  {} );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterScreen(

        ),
      ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Click & cart.png',fit: BoxFit.cover,),
              ],
            ),
        ),
    );
  }
}


