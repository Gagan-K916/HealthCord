import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcord/components/database.dart';
import 'package:healthcord/components/landingPage.dart';
import 'package:healthcord/components/models/doctor.dart';
import 'package:healthcord/constants/app_colors.dart';
import '../constants/measures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'register.dart';
import 'home.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage>{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void fieldAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text(
            'User Not Found!',
            style: GoogleFonts.poppins(
                color: Colors.red.shade600,
                fontSize: 19,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Please make sure username and password is correct.',
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
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding * 3),
        child: Container(
          alignment: Alignment.center,
          child: Row(children: [
            SizedBox(
              width: 900,
              child: Column(
              children: [
                Row(
                  children: [
                  SvgPicture.asset('assets/images/HealthCord Logo.svg'),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      Text('HealthCord',
                          style: GoogleFonts.manrope(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold))
                ],),
                SizedBox(height: 60),
                Text("WELCOME", style: GoogleFonts.teko(fontSize: 80, color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white), ),
                TextField(controller: usernameController,style: TextStyle(color: Colors.white) ,decoration: InputDecoration(labelStyle: TextStyle(color: secondaryColor),focusColor: Colors.white,hoverColor: secondaryColor ,iconColor: Colors.white,fillColor: Colors.white,icon: Icon(Icons.person_2_outlined) ,labelText: "Username", constraints: BoxConstraints(maxWidth: 600)), ),
                SizedBox(height: 20,),
                TextField(controller: passwordController,style: TextStyle(color: Colors.white) ,decoration: InputDecoration(labelStyle: TextStyle(color: secondaryColor),focusColor: Colors.white,hoverColor: secondaryColor ,iconColor: Colors.white,fillColor: Colors.white,icon: Icon(Icons.lock_open_outlined) ,labelText: "Password", constraints: BoxConstraints(maxWidth: 600)), ),
                SizedBox(height: 40),
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => secondaryColor), fixedSize: MaterialStateProperty.resolveWith((states) => Size(120, 50))),
                  onPressed: () async{
                    if(await isDoctor(await PatientDatabase.instance.database, usernameController.text, passwordController.text)){
                      String userName = await getDoctorFirstName(await PatientDatabase.instance.database, usernameController.text);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(username: userName,)));
                    }else{
                      fieldAlert();
                    }
                  },
                  child: Text("Login",
                    style: GoogleFonts.ptSans(
                      color: primaryColor,
                      fontSize: defaultFontSize + 5 ,
                      fontWeight: FontWeight.w700,
                    )),
                ),
                SizedBox(height: 30,),
                Text("OR", style: GoogleFonts.teko(color: Colors.white, fontSize: 25,),),
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => primaryColor), fixedSize: MaterialStateProperty.resolveWith((states) => Size(170, 50)),shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                       side: BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(circularRadius + 5)
                     ))),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text("Register",
                    style: GoogleFonts.ptSans(
                      color: Colors.white,
                      fontSize: defaultFontSize + 5 ,
                      fontWeight: FontWeight.w700,
                    )),
                ),
                SizedBox(width: 30,),
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => primaryColor), fixedSize: MaterialStateProperty.resolveWith((states) => Size(170, 50)),shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                       side: BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(circularRadius + 5)
                     ))),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                  },
                  child: Text("Back to Home",
                    style: GoogleFonts.ptSans(
                      color: Colors.white,
                      fontSize: defaultFontSize + 5 ,
                      fontWeight: FontWeight.w700,
                    )),
                )
                ],)
              ],),
            ),
            Spacer(),
            Image.asset('assets/images/loginassistant.png', height: 700,)
          ]),
        ),
      )
    );
  }
}