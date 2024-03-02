import 'package:bmi_calc/screens/homescreen.dart';
import 'package:bmi_calc/screens/profile.dart';
import 'package:bmi_calc/screens/results.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=> HomeScreen(),
        'results/':(context)=> ResultsPage(),
        'profiles/':(context)=>Profile()
      },
    );
  }
}