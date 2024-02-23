import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';

class LandingPage extends StatefulWidget{
  const LandingPage({super.key});

  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(circularRadius + 10), bottomRight: Radius.circular(circularRadius + 10))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Row(
                          children: [
                          SizedBox(width: defaultPadding*2,),
                          SvgPicture.asset('assets/images/HealthCord Logo.svg'), 
                          SizedBox(width: defaultPadding,),
                          Text('HealthCord',
                                style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),  
                          Spacer(),
                          TextButton(
                            onPressed: (){
                            },
                            child: Text("About",
                              style: GoogleFonts.ptSans(
                                color: Colors.white,
                                fontSize: defaultFontSize + 2,
                                fontWeight: FontWeight.w500,
                              )),
                          ),
                          SizedBox(width: defaultPadding*2,),
                          TextButton(
                            onPressed: (){},
                            child: Text("Login",
                              style: GoogleFonts.ptSans(
                                color: Colors.white,
                                fontSize: defaultFontSize + 2,
                                fontWeight: FontWeight.w500,
                              )),
                          ),
                          SizedBox(width: defaultPadding*2,),
                          TextButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white)),
                            onPressed: (){},
                            child: Text("Register",
                              style: GoogleFonts.ptSans(
                                color: primaryColor,
                                fontSize: defaultFontSize + 2,
                                fontWeight: FontWeight.w700,
                              )),
                          ),
                          SizedBox(width: defaultPadding*3,)
                          ],
                        ),
                      ),
                      decoration: BoxDecoration( borderRadius: BorderRadius.circular(circularRadius - 10)),
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      SizedBox(width: defaultPadding*2,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: defaultPadding,),
                        Text("Your Favourite\nPatient Management System",
                          style: GoogleFonts.ptSans(
                            color: Colors.white,
                            fontSize: defaultFontSize + 40,
                            fontWeight: FontWeight.w700,
                          )),
                          SizedBox(height: defaultPadding*2,),
                          Text("We Care, We Connect, We Empower - Your Journey to Vitality.",
                          style: GoogleFonts.ptSans(
                            color: Colors.white,
                            fontSize: defaultFontSize + 10,
                            fontWeight: FontWeight.w500,
                          )),
                          SizedBox(height: defaultPadding * 4,),
                          Row(children: [
                            TextButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => secondaryColor),
                              fixedSize: MaterialStateProperty.resolveWith((states) => Size(140,50 ))),
                              onPressed: (){},
                              child:  Text("Register",
                              style: GoogleFonts.ptSans(
                                color: primaryColor,
                                fontSize: defaultFontSize + 5,
                                fontWeight: FontWeight.w700,
                              ))
                            ),
                            SizedBox(width: defaultPadding*2,),
                            TextButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => primaryColor),
                              fixedSize: MaterialStateProperty.resolveWith((states) => Size(150,50 )),
                              shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                       side: BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(circularRadius + 5)
                     ))),
                              onPressed: (){},
                              child:  Text("Login",
                              style: GoogleFonts.ptSans(
                                color: Colors.white,
                                fontSize: defaultFontSize + 5,
                                fontWeight: FontWeight.w700,
                              ))
                            ),
                            SizedBox(height: 100,)
                          ],)          
                          ],),
                          Spacer(),
                          Image.network('https://assets-global.website-files.com/611ed5a217b32b056e5477ec/644988ded773ee3739f6691a_Online%20Medical%20Checkup%20(1).gif', height: 500,)
                    ],
                  ))
                ]
              ),
            ),
            Container(
              color: Colors.white,
              child:
              Column(children: [
                SizedBox(height: defaultPadding*3,),
                Text("Our Services",
                style: GoogleFonts.raleway(
                                color: Colors.brown.shade400,
                                fontSize: defaultFontSize + 5,
                                fontWeight: FontWeight.w400,
                              )),
                SizedBox(height: defaultPadding*2,),
                Text("Bridging the gap between doctors and patients:\nHealthCord for a healthier future.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: defaultFontSize + 8,
                                fontWeight: FontWeight.w400,
                              )),
                SizedBox(height: defaultPadding * 4,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                      Image.asset('assets/images/medMastery.png', height: 400,),
                      SizedBox(height: defaultPadding*2,),
                      Text("Med Mastery",
                      style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: defaultFontSize  + 2,
                                fontWeight: FontWeight.w400,
                              )),
                      SizedBox(height: defaultPadding,),
                      Text("Reminders, schedules, and clear instructions.",
                      style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: defaultFontSize,
                                fontWeight: FontWeight.w400,
                              )),
                      SizedBox(height: defaultPadding),
                      TextButton(style: ButtonStyle(alignment: Alignment.center),onPressed: (){}, child: Text("Learn More", textAlign: TextAlign.start,), )
                    ]),
                    Spacer(),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                      Image.asset('assets/images/nursingHome.png', height: 400,),
                      SizedBox(height: defaultPadding*2,),
                      Text("Track past & plan ahead",
                      style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: defaultFontSize  + 2,
                                fontWeight: FontWeight.w400,
                              )),
                      SizedBox(height: defaultPadding,),
                      Text("See visits, diagnoses, and next steps.",
                      style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: defaultFontSize,
                                fontWeight: FontWeight.w400,
                              )),
                      SizedBox(height: defaultPadding),
                      TextButton(style: ButtonStyle(alignment: Alignment.center),onPressed: (){}, child: Text("Learn More", textAlign: TextAlign.start,), )
                    ]),
                    Spacer(),
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                      Image.asset('assets/images/analytics.png', height: 400,),
                      SizedBox(height: defaultPadding*2,),
                      Text("Chart your course",
                      style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: defaultFontSize  + 2,
                                fontWeight: FontWeight.w400,
                              )),
                      SizedBox(height: defaultPadding,),
                      Text("Unravel health data with interactive insights.",
                      style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontSize: defaultFontSize,
                                fontWeight: FontWeight.w400,
                              )),
                      SizedBox(height: defaultPadding),
                      TextButton(style: ButtonStyle(alignment: Alignment.center),onPressed: (){}, child: Text("Learn More", textAlign: TextAlign.start,), )
                    ]),
                    Spacer()
                  ],
                )

              ],)
            ),
            Container(
              child: Row(children: [
                SizedBox(width: defaultPadding * 3),
                Image.asset('assets/images/iinteraction.png', height: 700,),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("We help you stay updated\nabout your patients on real time basis.",
                    style: GoogleFonts.poppins(
                                    color: primaryColor,
                                    fontSize: defaultFontSize + 20,
                                    fontWeight: FontWeight.w400,
                                  )),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                      Image.asset('assets/images/check.png', height: 50,),
                      SizedBox(width: 30,),
                      Text("Help your patients with their medications",
                              style: GoogleFonts.ptSans(
                                color: primaryColor,
                                fontSize: defaultFontSize + 5,
                                fontWeight: FontWeight.w500,
                              )),
                    ],),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                      Image.asset('assets/images/check.png', height: 50,),
                      SizedBox(width: 30,),
                      Text("Stay updated about your appointments",
                              style: GoogleFonts.ptSans(
                                color: primaryColor,
                                fontSize: defaultFontSize + 5,
                                fontWeight: FontWeight.w500,
                              )),
                    ],),
                    SizedBox(height: 30,),
                    Row(
                      children: [
                      Image.asset('assets/images/check.png', height: 50,),
                      SizedBox(width: 30,),
                      Text("High patient retainment",
                              style: GoogleFonts.ptSans(
                                color: primaryColor,
                                fontSize: defaultFontSize + 5,
                                fontWeight: FontWeight.w500,
                              )),
                    ],),
                    SizedBox(height: 30,),
                    TextButton(
                      style: ButtonStyle(fixedSize: MaterialStateProperty.resolveWith((states) => Size(350,50) ), backgroundColor: MaterialStateProperty.resolveWith((states) => primaryColor)),
                            onPressed: (){},
                            child: Text("Login",
                              style: GoogleFonts.ptSans(
                                color: Colors.white,
                                fontSize: defaultFontSize + 2,
                                fontWeight: FontWeight.w500,
                              )),
                          )
                  ],
                ),
              SizedBox(width: defaultPadding * 3)

              ],),
            )
          ],
        ),
      )
    );
  }

}