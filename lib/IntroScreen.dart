import 'dart:async';
import 'package:flutter/material.dart';
import 'Mainlayer.dart';
class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<Introscreen> {
  final PageController _controller = PageController();
  Timer? _timer;

  final List<String> images = [
    "assets/images/Intro 1.png",
    "assets/images/Intro 2.png",
    "assets/images/Intro 3.png",
    "assets/images/Intro 4.png",
    "assets/images/Intro 5.png",
  ];

  void _startTimer() {
    _timer?.cancel(); 
    _timer = Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Mainlayer()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); 
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        onPageChanged: (index) {
          setState(() {
          });

          if (index == images.length - 1) {
            _startTimer();
          }
        },
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(images[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}