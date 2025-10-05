import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppConstns.dart';
import 'package:flutter_application_4/Hadeestab.dart';
import 'package:flutter_application_4/Qurantab.dart';
import 'package:flutter_application_4/Sebhatab.dart';
import 'package:flutter_application_4/Timertab.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Radiotab.dart';


class Mainlayer extends StatefulWidget {
  static const String routName='/mainlayer';
  const Mainlayer({super.key});

  @override
  State<Mainlayer> createState() => _MainlayerState();
}

class _MainlayerState extends State<Mainlayer> {
  int currenttab = 0;

  final List<Widget> tabs = [
   Qurantab(),
   Hadeestab(),
    SebhaScreen(),
   RadioScreen(),
  PrayerTimeScreen(),
   
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: tabs[currenttab],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currenttab,              
        type: BottomNavigationBarType.fixed,      
        onTap: (index) {
          setState(() {
            currenttab = index;                  
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Appconstns.Quranicon, width: 25),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Appconstns.Hadeesicon, width: 25),
            label: 'Hadees',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Appconstns.Sebhaicon, width: 25),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Appconstns.Radioicon, width: 25),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Appconstns.Timericon, width: 25),
            label: 'Timer',
          ),
        ],
      ),
    );
  }
}