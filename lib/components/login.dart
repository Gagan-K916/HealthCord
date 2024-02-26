import 'package:flutter/material.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding*2),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                            SvgPicture.asset('assets/images/HealthCord Logo.svg'), 
                            SizedBox(width: defaultPadding,),
                            Text('HealthCord',
                                  style: GoogleFonts.manrope(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
              Spacer(),
              Image.asset('assets/images/loginassistant.png', height: 700,)
            ]),
          ),
        ],
      ),
    );
  }
}