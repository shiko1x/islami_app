import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_4/AppConstns.dart';
import 'package:flutter_application_4/Appcolor.dart';
import 'package:flutter_application_4/hadeethmodel.dart';

class Hadeestab extends StatefulWidget {
  const Hadeestab({super.key});

  @override
  State<Hadeestab> createState() => _HadeestabState();
}

class _HadeestabState extends State<Hadeestab> {
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );

  int currentPage = 0;
  List<Hadeethmodel> dataList = [];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if ((controller.page ?? 0).toInt() != currentPage) {
        setState(() {
          currentPage = (controller.page ?? 0).toInt();
        });
      }
    });
    loadAhadeth2();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Appconstns.Hadeestab),
          fit: BoxFit.cover,
        ),
      ),
      child:
       Expanded(
         child: dataList.isEmpty?Center(child: 
         CircularProgressIndicator(color: Appcolor.goldColor,),):
         PageView.builder(
          controller: controller,
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            Hadeethmodel hadeethmodel = dataList[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: index != currentPage ? 20.0 : 0,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
                padding: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Appcolor.goldColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      Appconstns.hadethcard,
                      fit: BoxFit.fill,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 42),
                        
                        Text(
                          hadeethmodel.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Appcolor.blackColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              hadeethmodel.content,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Appcolor.blackColor,
                              ),
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
               ),
       ),
    );
  }


  loadAhadeth2() async {
    List<Hadeethmodel> ahadeethList = [];
    for (var i = 1; i < 51; i++) {
      String result = await rootBundle.loadString('assets/Hadeeth/h$i.txt');

      String title = result.split('\n').first.trim();
      String content = result.substring(title.length).trim();

      Hadeethmodel hadeethmodel = Hadeethmodel(
        content: content,
        title: title,
        index: i,
      );
      ahadeethList.add(hadeethmodel);
    }
    setState(() {
      dataList = ahadeethList;
    });
  }
}

    
