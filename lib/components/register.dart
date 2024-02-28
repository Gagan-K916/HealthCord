import 'package:flutter/material.dart';
import 'package:healthcord/components/database.dart';
import 'package:healthcord/components/models/doctor.dart';
import 'package:healthcord/constants/measures.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'landingPage.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({super.key});

  RegisterState createState() => RegisterState();
}

class RegisterState extends State<RegisterPage>{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final genderController = TextEditingController();
  final specializationController = TextEditingController();

  void registerAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(
            'User Registered!',
            style: GoogleFonts.poppins(
                color: Colors.green.shade700,
                fontSize: 19,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'You can try logging in now',
            style: GoogleFonts.poppins(
                color: primaryColor, fontSize: 15, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circularRadius))),
    );
  }

  void fieldAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(
            'WARNING!',
            style: GoogleFonts.poppins(
                color: Colors.red.shade600,
                fontSize: 19,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Please make sure all the fields are filled in.',
            style: GoogleFonts.poppins(
                color: primaryColor, fontSize: 15, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circularRadius))),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding * 3),
        child: Container(
          alignment: Alignment.center,
          child: Row(children: [
            SizedBox(width: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                  SvgPicture.asset('assets/images/HealthCord Logo.svg'),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Text('HealthCord',
                          style: GoogleFonts.manrope(
                              color: primaryColor,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))
                ],),
                Image.asset('assets/images/registerassistant.jpg', height: 650,),
              ],
            ),
            Spacer(),
            SizedBox(
              width: 900,
              child: Column(
              children: [
                SizedBox(height: 40),
                Text("Hey there!", style: GoogleFonts.teko(fontSize: 60, color: primaryColor, decorationColor: Colors.white), ),
                Row(
                  children: [
                    SizedBox(width: 150),
                    TextField(controller: firstNameController,style: GoogleFonts.notoSans(color: primaryColor, fontWeight: FontWeight.w500) ,decoration: InputDecoration(labelStyle: TextStyle(color: primaryColor),focusColor: Colors.white,hoverColor: secondaryColor ,iconColor: Colors.white,fillColor: Colors.white,icon: Icon(Icons.person_2_outlined) ,border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor, width: 3)),labelText: "First Name",constraints: BoxConstraints(maxWidth: 300)), ),
                    TextField(controller: lastNameController,style: GoogleFonts.notoSans(color: primaryColor,fontWeight: FontWeight.w500) ,decoration: InputDecoration(labelStyle: TextStyle(color: primaryColor),focusColor: Colors.white,hoverColor: secondaryColor ,iconColor: Colors.white,fillColor: Colors.white,icon: Icon(Icons.person_2_outlined) ,border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor, width: 3)),labelText: "Last Name", constraints: BoxConstraints(maxWidth: 300)), )
                  ],
                ),
                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 40,),
                    DropdownMenu(
                      label: Text("Gender"),
                    inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor))),
                    width: 560,
                    controller: genderController,
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 'Male', label: 'Male'),
                      DropdownMenuEntry(value: 'Female', label: 'Female')
                    ],
                    textStyle: GoogleFonts.rubik()),
                  ],
                ),
                SizedBox(height: 20,),
                TextField(controller: specializationController,style: GoogleFonts.notoSans(color: primaryColor, fontWeight: FontWeight.w500) ,decoration: InputDecoration(labelStyle: TextStyle(color: primaryColor),focusColor: Colors.white,hoverColor: secondaryColor ,iconColor: Colors.white,fillColor: Colors.white,icon: Icon(Icons.lock_open_outlined) ,border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor, width: 3)),labelText: "Specialization", constraints: BoxConstraints(maxWidth: 600)), ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 150),
                    TextField(controller: emailController,style: GoogleFonts.notoSans(color: primaryColor, fontWeight: FontWeight.w500) ,decoration: InputDecoration(labelStyle: TextStyle(color: primaryColor),focusColor: Colors.white,hoverColor: secondaryColor ,iconColor: Colors.white,fillColor: Colors.white,icon: Icon(Icons.lock_open_outlined) ,border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor, width: 3)),labelText: "Email (Username)", constraints: BoxConstraints(maxWidth: 300)), ),
                    TextField(controller: phoneController,style: GoogleFonts.notoSans(color: primaryColor, fontWeight: FontWeight.w500) ,decoration: InputDecoration(labelStyle: TextStyle(color: primaryColor),focusColor: Colors.white,hoverColor: secondaryColor ,iconColor: Colors.white,fillColor: Colors.white,icon: Icon(Icons.lock_open_outlined) ,border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor, width: 3)),labelText: "Phone", constraints: BoxConstraints(maxWidth:300)), ),
                
                  ],
                ),
                SizedBox(height: 20,),
                TextField(controller: passwordController,style: GoogleFonts.notoSans(color: primaryColor, fontWeight: FontWeight.w500) ,decoration: InputDecoration(labelStyle: TextStyle(color: primaryColor),focusColor: Colors.white,hoverColor: secondaryColor ,iconColor: Colors.white,fillColor: Colors.white,icon: Icon(Icons.lock_open_outlined) ,border: OutlineInputBorder(borderSide: BorderSide(color: primaryColor, width: 3)),labelText: "Password", constraints: BoxConstraints(maxWidth: 600)), ),
                SizedBox(height: 20,),
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => primaryColor), fixedSize: MaterialStateProperty.resolveWith((states) => Size(120, 50))),
                  onPressed: () async{
                    if(firstNameController.text.isNotEmpty & lastNameController.text.isNotEmpty & genderController.text.isNotEmpty & emailController.text.isNotEmpty & phoneController.text.isNotEmpty & passwordController.text.isNotEmpty & specializationController.text.isNotEmpty){
                    registerDoctor(await PatientDatabase.instance.database, firstNameController.text, lastNameController.text, genderController.text, emailController.text, phoneController.text, specializationController.text, passwordController.text);
                    registerAlert();
                    await Future.delayed(Duration(seconds: 2));
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                    }else{
                      fieldAlert();
                    }
                  },
                  child: Text("Register",
                    style: GoogleFonts.ptSans(
                      color: Colors.white,
                      fontSize: defaultFontSize + 5 ,
                      fontWeight: FontWeight.w700,
                    )),
                ),
                SizedBox(height: 10,),
                Text("OR", style: GoogleFonts.teko(color: primaryColor, fontSize: 25,),),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white), fixedSize: MaterialStateProperty.resolveWith((states) => Size(170, 50)),shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                       side: BorderSide(color: primaryColor, width: 2.0), borderRadius: BorderRadius.circular(circularRadius + 5)
                     ))),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                  },
                  child: Text("Login",
                    style: GoogleFonts.ptSans(
                      color: primaryColor,
                      fontSize: defaultFontSize + 5 ,
                      fontWeight: FontWeight.w700,
                    )),
                ),
                SizedBox(width: 30,),
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white), fixedSize: MaterialStateProperty.resolveWith((states) => Size(170, 50)),shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                       side: BorderSide(color: primaryColor, width: 2.0), borderRadius: BorderRadius.circular(circularRadius + 5)
                     ))),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                  },
                  child: Text("Back to Home",
                    style: GoogleFonts.ptSans(
                      color: primaryColor,
                      fontSize: defaultFontSize + 5 ,
                      fontWeight: FontWeight.w700,
                    )),
                )
                ],)
              ],),
            ),
            
          ]),
        ),
      )
    );
  }
}