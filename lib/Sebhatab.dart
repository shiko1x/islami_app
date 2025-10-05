import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppConstns.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(        
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Background.png'),
              fit: BoxFit.cover,    
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 80), 
              
              
              Image.asset(
                Appconstns.islamilogo,
                width: 320,   
              ),

              const SizedBox(height: 25),

            
              const Text(
                'سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 100,),

             
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    Appconstns.Sebhabody,
                    width: 340, 
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'سبحان الله',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '30',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}