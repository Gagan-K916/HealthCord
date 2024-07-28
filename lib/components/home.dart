import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthcord/components/doctors.dart';
import 'package:healthcord/components/landingPage.dart';
import 'package:healthcord/components/patients.dart';
import '../constants/app_colors.dart';
import '../constants/measures.dart';
import 'dashboard.dart';
import 'appointments.dart';
import 'prescriptions.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  String username = '';
  Home({super.key, required this.username});

  @override
  HomeState createState() => HomeState();
}



class HomeState extends State<Home> {
  int _selectedIndex = 1;
  bool _extended = true;

  List<String> destinations = [
    '',
    'Dashboard',
    'Patients',
    'Appointments',
    'Prescriptions',
    'Doctors',
    ''
  ];

  Text textFormatter(String text) {
    return Text(text,
        style: GoogleFonts.ptSans(
          color: Colors.white,
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w500,
        ));
  }

  Future<bool> _shouldExitApp(BuildContext context) async {
  bool shouldExit = false;
  
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Confirm Exit"),
        content: Text("Are you sure you want to exit?"),
        actions: [
           TextButton(
             onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Home(username: widget.username)));
             },
             child: Text("No"),
           ),
           TextButton(
             onPressed: () {
               shouldExit = true;
               Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));  
             },
             child: Text("Yes"),
           ),
         ],
       );
     }
   );

  return shouldExit; 
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey.shade100,
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(children: [
          AnimatedContainer(
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(circularRadius))),
              alignment: Alignment.center,
              duration: const Duration(milliseconds: 400),
              child: NavigationRail(
                backgroundColor: Colors.transparent,
                selectedIndex: _selectedIndex,
                extended: _extended,
                destinations: [
                  NavigationRailDestination(
                      icon:
                          SvgPicture.asset('assets/images/HealthCord Logo.svg'),
                      label: Text('HealthCord',
                          style: GoogleFonts.manrope(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      padding: const EdgeInsets.only(top: 20),
                      disabled: true),
                  NavigationRailDestination(
                      icon: const Icon(Icons.home_rounded),
                      label: textFormatter('Home'),
                      padding: const EdgeInsets.only(
                          top: 40,
                          left: defaultPadding,
                          right: defaultPadding,
                          bottom: defaultPadding)),
                  NavigationRailDestination(
                      icon: const Icon(Icons.bed),
                      label: textFormatter('Patients'),
                      padding: const EdgeInsets.all(defaultPadding)),
                  NavigationRailDestination(
                      icon: const Icon(Icons.calendar_month),
                      label: textFormatter('Appointments'),
                      padding: const EdgeInsets.all(defaultPadding)),
                  NavigationRailDestination(
                      icon: const Icon(Icons.medical_information_rounded),
                      label: textFormatter('Prescriptions'),
                      padding: const EdgeInsets.all(defaultPadding)),
                  NavigationRailDestination(
                      icon: const Icon(Icons.person_2_rounded),
                      label: textFormatter('Doctors'),
                      padding: const EdgeInsets.all(defaultPadding)),
                  NavigationRailDestination(
                      icon: const Icon(Icons.logout_rounded),
                      label: textFormatter('Logout'),
                      padding: const EdgeInsets.all(defaultPadding)),
                  
                ],
                onDestinationSelected: (int value) async {
                  if(value == 6){
                    bool shouldExit = await _shouldExitApp(context);
                    if (shouldExit) {      
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
                      }
                  }
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                unselectedIconTheme: const IconThemeData(color: Colors.white),
                indicatorColor: secondaryColor,
              )),
          const SizedBox(width: defaultPadding - 3),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                          Radius.circular(circularRadius)),
                      border: Border.all(color: defaultBorderColor)),
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: defaultPadding, left: defaultPadding),
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                _extended = !_extended;
                              });
                            },
                            elevation: 0.0,
                            focusElevation: 0.0,
                            hoverElevation: 0.0,
                            shape: const CircleBorder(eccentricity: 0.5),
                            hoverColor: primaryColor.withOpacity(0.2),
                            backgroundColor: Colors.white,
                            child: const Icon(Icons.menu_rounded,
                                color: primaryColor, shadows: null, size: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: defaultPadding - 3, left: defaultPadding),
                          child: Text(destinations[_selectedIndex],
                              style: GoogleFonts.ptSans(
                                color: primaryColor,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              )),
                        )
                      ],
                    ),
                    IndexedStack(
                      index: _selectedIndex,
                      children: [
                        Container(),
                        dashboard(username: widget.username,),
                        patients(username: widget.username,),
                        Appointments(username: widget.username,),
                        Prescriptions(username: widget.username,),
                        Doctors(),
                        Container()
                      ],
                    )
                  ])))
        ]),
      ),
    );
  }
}
