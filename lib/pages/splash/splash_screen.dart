import 'package:flutter/material.dart';
import 'package:forward/pages/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> init() async {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomePage(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  var logo = 'assets/images/app_logo.png';
  var sub = "ToDo";
  var logoSize = 0.3;
  var textSize = 0.04;

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screen.width * logoSize),
              child: Image.asset(logo),
            ),
            Text(sub, style: TextStyle(fontSize: screen.width * textSize)),
          ],
        ),
      ),
    );
  }
}
