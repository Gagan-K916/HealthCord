import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_colors.dart';
import '../constants/measures.dart';
import 'greeting.dart';

import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  bool _extended = true;
  String username = "Shastry";

  List<String> destinations = [
    '',
    'Dashboard',
    'Patients',
    'Appointments',
    'Prescriptions',
    '',
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
                      icon: const Icon(Icons.person_2_rounded),
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
                      icon: const Icon(Icons.settings_rounded),
                      label: textFormatter('Settings'),
                      padding: const EdgeInsets.all(defaultPadding)),
                  NavigationRailDestination(
                      icon: const Icon(Icons.logout_rounded),
                      label: textFormatter('Logout'),
                      padding: const EdgeInsets.all(defaultPadding))
                ],
                onDestinationSelected: (int value) {
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: defaultPadding + 20,
                          left: defaultPadding,
                          right: defaultPadding),
                      child: Container(
                          height: 120,
                          decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(circularRadius))),
                          child: Greeting(username)),
                    )
                  ])))
        ]),
      ),
    );
  }
}
