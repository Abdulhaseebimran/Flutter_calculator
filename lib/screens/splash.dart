import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttercalculator/screens/calculator.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
  super.initState();
  Timer(const Duration(seconds:3), () => Navigator.pushReplacement( context,
        MaterialPageRoute(
          builder: (context) => const Calculator()),
  )
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calculate_rounded,
            size: 50,),
            const Text("Calculator App",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),)
          ],
        ),
      ),
    );
  }
}