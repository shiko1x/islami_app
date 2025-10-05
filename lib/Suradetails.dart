import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_4/AppConstns.dart';
import 'package:flutter_application_4/Appcolor.dart';
import 'Suramodel.dart';

class SuradetailsPage extends StatefulWidget {
  static const String routName = '/Suradetails';
  const SuradetailsPage({super.key});

  @override
  State<SuradetailsPage> createState() => _SuradetailsPageState();
}

class _SuradetailsPageState extends State<SuradetailsPage> {
  String suraText = ''; 
  List <String> ayat =[];

  @override
  Widget build(BuildContext context) {
    Suramodel suramodel =
        ModalRoute.of(context)!.settings.arguments as Suramodel;

    if (suraText.isEmpty) {
      getSuradata(suramodel.index);
    }

    return Scaffold(
      backgroundColor: Appcolor.blackColor,
      appBar: AppBar(title: Text(suramodel.enName)),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(Appconstns.Suradetails, fit: BoxFit.fill),
          Expanded(
            child: SingleChildScrollView(  
              padding: const EdgeInsets.only(left: 30.0,right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    suramodel.arName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.goldColor,
                    ),
                  ),
                   SizedBox(height: 10),
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20 ),
                    child:RichText(text:TextSpan( children: ayat.map((e)
                    =>TextSpan(text: e + '*'),
                    ).toList()
                    ,style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Appcolor.goldColor,
                    )), textDirection:TextDirection.rtl ,textAlign: TextAlign.justify,)
                  ),
                  SizedBox(height: 150,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getSuradata(int index) async {
     {
      String res = await rootBundle.loadString('assets/Suras/$index.txt');
      

      setState(() {
        ayat= res.trim().split
        ('\n');
        suraText = res;   
      });
    }
  }
}
