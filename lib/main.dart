import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nationality/views/home.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Nation Wind',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: Home(),
          );
        }
    );
  }
}

