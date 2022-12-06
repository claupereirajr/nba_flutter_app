import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    initialization();
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 98, 28, 175),
      body: Center(
        child: RiveAnimation.asset(
          'assets/rive/642-1469-basketball.riv',
        ),
      ),
    );
  }
}
