import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F9DA),
      body:  Column(
        children: [
          Center(child: Image.asset('assets/icon.png',height: 100,width: 100,)),
        ],
      ),
    );
  }
}
