import 'package:flutter/material.dart';
import 'package:flutter_application_4/AppConstns.dart';
import 'package:flutter_application_4/Appcolor.dart';
import 'package:flutter_application_4/Suradetails.dart';
import 'package:flutter_svg/svg.dart';
import 'Suramodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Qurantab extends StatefulWidget {
 Qurantab({super.key, this.hinttext, this.padding, this.prefixIcon});
  final String? hinttext;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? padding;

@override
  State<Qurantab> createState() => _QurantabState();
}

class _QurantabState extends State<Qurantab> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
   
   
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Appconstns.Qurantab),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                Appconstns.islamilogo,
                height: 140,
                width: 400,
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                style: const TextStyle(
                  color: Appcolor.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Appcolor.grayColor.withOpacity(.7),
                  enabledBorder: getborder(),
                  focusedBorder: getborder().copyWith(
                    borderSide: const BorderSide(color: Appcolor.goldColor),
                  ),
                  hintText: widget.hinttext ?? "Sura Name",
                  hintStyle: TextStyle(
                    color: Appcolor.whiteColor.withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      Appconstns.Quranicon,
                      colorFilter: const ColorFilter.mode(
                        Appcolor.goldColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 220, child: const MostRecentView()),
            const SizedBox(height: 20),

           
            Expanded(child: Suralistvew(searchText: searchText)),
          ],
        ),
      ),
    );
  }
  
   }



OutlineInputBorder getborder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Appcolor.goldColor),
  );
}


class MostRecentView extends StatefulWidget {
  const MostRecentView({super.key});

  @override
  State<MostRecentView> createState() => _MostRecentViewState();
}

class _MostRecentViewState extends State<MostRecentView> {
  List<Suramodel> mostRecent=[];
  void initState(){
    super.initState();
    loadMostRecent();
  }
  @override
  Widget build(BuildContext context) {
     loadMostRecent();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Most Recently',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Appcolor.offwhiteColor,
          ),
        ),
        SizedBox(
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: mostRecent.length,
            itemBuilder: (context, index) {
              Suramodel sura=mostRecent[index];
              return SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Card(
                color: Appcolor.goldColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10,
                   right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                           sura.enName,
                            style: const TextStyle(
                              color: Appcolor.blackColor,
                              fontSize: 30,
                              
                            ),
                          ),
                          Text(
                            sura.arName,
                            style: const TextStyle(
                              color: Appcolor.blackColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           Text(
                            '${sura.verses} Verses',
                            style: TextStyle(
                              color: Appcolor.blackColor,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 200,
                        child: Image.asset(
                          Appconstns.MostRecentView,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
            },
            separatorBuilder: (context, index) => 
            const SizedBox(width: 5),
          ),
        ),
      ],
    );
  }
   loadMostRecent() async {
SharedPreferences pref= await SharedPreferences.getInstance();

List<String> data= pref.getStringList('mostRecent')??[];
print("----${data}");
 List<Suramodel> suras = 
  data.map((e) => Suramodel.surasMapper[int.parse(e) - 1]).toList();
  setState(() {
    mostRecent=suras.reversed.toList();
  });


}}
class Suralistvew extends StatelessWidget {
  const Suralistvew({super.key, required this.searchText});
  final String searchText;
   

  @override
  Widget build(BuildContext context) {

    final filteredSuras = Suramodel.surasMapper.where((sura) {
      final query = searchText.toLowerCase();
      return sura.enName.toLowerCase().contains(query) ||
          sura.arName.contains(query);
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Suras List',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Appcolor.offwhiteColor,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredSuras.length,
            itemBuilder: (context, index) {
              Suramodel currentsura = filteredSuras[index];
              return ListTile(
                onTap: () {

Cashsuratolist(currentsura.index);
                  Navigator.of(context).pushNamed(
                  SuradetailsPage.routName,
                  arguments: currentsura,
                );
                },
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.brightness_5,
                      size: 50,
                      color: Appcolor.whiteColor,
                    ),
                    Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                        color: Appcolor.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                title: Text(
                  currentsura.enName,
                  style: const TextStyle(
                    color: Appcolor.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  currentsura.verses,
                  style: const TextStyle(
                    color: Appcolor.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  currentsura.arName,
                  style: const TextStyle(
                    color: Appcolor.whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Cashsuratolist(int index) async {SharedPreferences pref= await SharedPreferences.getInstance();

List<String> data= pref.getStringList('mostRecent')??[];

data.add(index.toString());
pref.setStringList('mostRecent', data);


  }
}
