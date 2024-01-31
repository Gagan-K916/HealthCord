import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/constants/app_colors.dart';
import '../constants/measures.dart';

class Greeting extends StatelessWidget {
  final String username; 

  const Greeting(this.username, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.centerStart,
          clipBehavior: Clip.none,
          children: [
            Positioned(
                bottom: 0,
                left: 20,
                child: Image.asset('assets/images/doctor.png', width: 150,)
              ),
            Container(
              width: 150,
            )
          ]
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hi, Dr. $username',
                textAlign: TextAlign.left,
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontSize: defaultFontSize * 1.75,
                  fontWeight: FontWeight.w600,
                )),
              Text('Have a nice day at work!',
                textAlign: TextAlign.left,
                style: GoogleFonts.ptSans(
                  color: secondaryColor,
                  fontSize: defaultFontSize,
                  fontWeight: FontWeight.w400,
                )), 
            ],
          ),
        ),
      ],
    );
  }
}
