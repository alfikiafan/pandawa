import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pandawa/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 250,
            ),
            const Text(
              'Ensiklopedia Wayang',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}