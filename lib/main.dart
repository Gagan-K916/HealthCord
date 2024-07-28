import 'package:flutter/material.dart';
import 'package:healthcord/components/database.dart';
import 'package:healthcord/components/landingPage.dart';


void main() async{
  await PatientDatabase.instance.database;
  runApp(const HealthCord());
}

class HealthCord extends StatelessWidget{

  const HealthCord({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'HealthCord',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(useMaterial3: true),
      home: const LandingPage(),
    );
  }
}