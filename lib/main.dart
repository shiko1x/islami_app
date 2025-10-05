import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppTheme.dart';
import 'package:flutter_application_4/IntroScreen.dart';
import 'package:flutter_application_4/Mainlayer.dart';
import 'package:flutter_application_4/Suradetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  Apptheme.appTheme,
      routes:{
      Mainlayer.routName:(_)=>Mainlayer(),
        SuradetailsPage.routName:(_)=>SuradetailsPage(),
      } ,
      home: SplashScreen(),
     
  
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Introscreen()),
      );
    });
  } 

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Rectangle 1.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: size.width * 0.05,
              right: 0,
              child: Image.asset(
                "assets/images/Glow.png",
                width: size.width * 0.18,
              ),
            ),
            Positioned(
              top: size.width * 0.50,
              left: 0,
              child: Image.asset(
                "assets/images/Shape-07 1.png",
                width: size.width * 0.20,
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.10),
                  Image.asset(
                    'assets/images/Mosque-01 1.png',
                    width: size.width * 0.60,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Image.asset(
                    'assets/images/Group 36.png',
                    width: size.width * 0.60,
                  ),
                  SizedBox(height: size.height * 0.20),
                  Image.asset(
                    'assets/images/route_logo.png',
                    width: size.width * 0.60,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: size.width * 0.20,
              right: 0,
              child: Image.asset(
                "assets/images/Shape-04 1.png",
                width: size.width * 0.20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
