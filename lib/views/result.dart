import 'package:country_provider/country_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nationality/views/home.dart';
import 'package:sizer/sizer.dart';

class Result extends StatefulWidget {
  const Result({
    Key key,
    this.data,
  }) : super(key: key);
  final data;
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var info;
  List country = [];
  List probability = [];
  List countryName = [];
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  getData() async{
    setState(() {
      info = widget.data;
      info['country'].forEach((element) {
        print(element['country_id']);
        country.add(element['country_id']);
        print(element['probability']);
        probability.add(element['probability']);
      });
    });
    for(int i = 0; i <= (country.length - 1); i++){
      Country result = await CountryProvider.getCountryByCode("${country[i].toString().toLowerCase()}");
      print(result.name);
      setState(() {
        countryName.add(result.name);

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Results", style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: countryName.length,
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: ListTile(
                          leading: Image.asset('icons/flags/png/${country[index].toString().toLowerCase()}.png', package: 'country_icons'),
                          title: Text("${countryName[index]}", style: GoogleFonts.poppins()),
                          trailing: Text('${(probability[index] * 100).toStringAsFixed(2)}%', style: GoogleFonts.poppins())
                      ),
                    );
                  }
              ),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
                child: Container(
                  width: MediaQuery.of(context).size.width/1.3,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                          colors: [
                            Colors.red[300],
                            Colors.red[400],
                            Colors.red,
                            Colors.red[600],
                            Colors.red[700],
                          ]
                      ),

                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Check more names',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
