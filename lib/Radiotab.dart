import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppConstns.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
             Appconstns.Radiobackground,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 60),
              Center(
                child: Image.asset(
                  Appconstns.islamilogo,
                  height: 100,
                ),
              ),
              const SizedBox(height: 30),
              Image.asset(Appconstns.tab1),
              const SizedBox(height: 5),
              Image.asset(Appconstns.tab2),
              const SizedBox(height: 5),
              Image.asset(Appconstns.tab3),
              const SizedBox(height: 5),
              Image.asset(Appconstns.tab4),
            ],
          ),
        ],
      ),
    );
  }
}