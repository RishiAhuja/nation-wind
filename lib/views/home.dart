import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nationality/views/result.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

bool _isLoading = false;
class RandomImage extends StatelessWidget {
  final int random;
  RandomImage({this.random});

  @override
  Widget build(BuildContext context) {
    if(random == 0){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/1.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/1.png', width: 25.h, height: 25.h,));
    }if(random == 1){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/2.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/2.png', width: 25.h, height: 25.h,));
    }if(random == 2){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/3.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/3.png', width: 25.h, height: 25.h,));
    }if(random == 3){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/4.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/4.png', width: 25.h, height: 25.h,));
    }if(random == 4){
      return SizerUtil.orientation == Orientation.portrait ? Image.asset('assets/home/5.png',) : Align(alignment: Alignment.center,child: Image.asset('assets/home/5.png', width: 30.h, height: 30.h,));
    }
  }
}

int _random = 0;
var info;
class _HomeState extends State<Home> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var rng = new Random();
    setState(() {
      _random = rng.nextInt(5);
      print(_random);
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
              child: Image.asset('assets/home/india.png', width: 60, height: 60,),
            ),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ),
        body: _isLoading ? Center(child: CircularProgressIndicator()) : Container(
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Let's test Nationality", style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              RandomImage(random: _random),
              const SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey[400], width: 1)
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextFormField(
                  controller: controller,
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type someone's name..",
                      hintStyle: GoogleFonts.poppins(
                          color: Colors.grey
                      )
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: GestureDetector(
                  onTap: () async{
                    setState(() {
                      _isLoading = true;
                    });
                    var req = await http.get(Uri.parse('https://api.nationalize.io/?name=${controller.text}'));
                    setState(() {
                      info = json.decode(req.body);
                      _isLoading = false;
                    });
                    print(info['name']);
                    print(info['country']);
                    info['country'].forEach((element) {
                      print(element);
                      print(element['country_id']);
                      print(element['probability']);
                    });
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Result(data: info,)));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.3,
                    height: 50,
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
                        )
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Test Nationality',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () async{
                  await launch('https://rishiahuja.github.io/my-portfolio');
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Developed by ',
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                        ),
                      ),
                      Text(
                        'Rishi',
                        style: GoogleFonts.poppins(
                          fontSize: 10.sp,
                          decoration: TextDecoration.underline
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}


