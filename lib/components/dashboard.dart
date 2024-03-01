import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/components/database.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';
import 'greeting.dart';

class PatientCard1 extends StatefulWidget{
  const PatientCard1({super.key});

  _PatientCard1State createState()=> _PatientCard1State();
}

class _PatientCard1State extends State<PatientCard1>{

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Total Patients", style: GoogleFonts.kanit(
          color: Colors.black,
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w500,
        )),
        Text("${PatientDatabase.totalNoOfPatients}", style: GoogleFonts.robotoCondensed(
          color: primaryColor,
          fontSize: defaultFontSize * 2.5,
          fontWeight: FontWeight.w800,
        )),
      ],
    );
  }
}

class PatientCard2 extends StatefulWidget{
  const PatientCard2({super.key});

  _PatientCard2State createState()=> _PatientCard2State();
}

class _PatientCard2State extends State<PatientCard2>{

  int beingTreated = 4;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No. of Male Patients", style: GoogleFonts.kanit(
          color: Colors.black,
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w500,
        )),
        Text("${PatientDatabase.noOfMalePatients}", style: GoogleFonts.robotoCondensed(
          color: primaryColor,
          fontSize: defaultFontSize * 2.5,
          fontWeight: FontWeight.w800,
        )),
      ],
    );
  }
}

class PatientCard3 extends StatefulWidget{
  const PatientCard3({super.key});

  _PatientCard3State createState()=> _PatientCard3State();
}

class _PatientCard3State extends State<PatientCard3>{

  int patientsTreated = 16;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No. of Female Patients", style: GoogleFonts.kanit(
          color: Colors.black,
          fontSize: defaultFontSize,
          fontWeight: FontWeight.w500,
        )),
        Text("${PatientDatabase.noOfFemalePatients}", style: GoogleFonts.robotoCondensed(
          color: primaryColor,
          fontSize: defaultFontSize * 2.5,
          fontWeight: FontWeight.w800,
        )),
      ],
    );
  }
}

class AppointmentCard1 extends StatefulWidget{
  const AppointmentCard1({super.key});

  _AppointmentCard1State createState()=> _AppointmentCard1State();
}

class _AppointmentCard1State extends State<AppointmentCard1>{

  int totalAppointments = 36;

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(circularRadius)
      )),
    height: defaultCardHeight + 5,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Total Appointments\t\t\t", style: GoogleFonts.kanit(
      color: Colors.white,
      fontSize: defaultFontSize + 3,
      fontWeight: FontWeight.w500,
    )),
    Text("${PatientDatabase.totalAppointments}", style: GoogleFonts.robotoCondensed(
      color: secondaryColor,
      fontSize: defaultFontSize * 2,
      fontWeight: FontWeight.w800,
    ))],),
    );
  }
}

class AppointmentCard2 extends StatefulWidget{
  const AppointmentCard2({super.key});

  _AppointmentCard2State createState()=> _AppointmentCard2State();
}

class _AppointmentCard2State extends State<AppointmentCard2>{

  int pendingAppointments = 6;

  @override
  Widget build(BuildContext context){
    return Container(
        decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(circularRadius)
        )),
      height: defaultCardHeight + 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Prescriptions Assigned\t\t\t", style: GoogleFonts.kanit(
        color: Colors.white,
        fontSize: defaultFontSize + 3,
        fontWeight: FontWeight.w500,
      )),
      Text("${PatientDatabase.totalPrescriptions}", style: GoogleFonts.robotoCondensed(
        color: secondaryColor,
        fontSize: defaultFontSize * 2,
        fontWeight: FontWeight.w800,
      ))],),
      );
  }
}

class AppointmentCard3 extends StatefulWidget{
  const AppointmentCard3({super.key});

  _AppointmentCard3State createState()=> _AppointmentCard3State();
}

class _AppointmentCard3State extends State<AppointmentCard3>{

  int completedAppointments = 30;

  @override
  Widget build(BuildContext context){
    return Container(
        decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(circularRadius)
        )),
      height: defaultCardHeight * 2/3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Appointments Completed\t\t\t", style: GoogleFonts.kanit(
        color: Colors.white,
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w500,
      )),
      Text("${PatientDatabase.completedAppointments}", style: GoogleFonts.robotoCondensed(
        color: secondaryColor,
        fontSize: defaultFontSize * 2,
        fontWeight: FontWeight.w800,
      ))],),
      );
  }
}


class PrescriptionCard1 extends StatefulWidget{
  const PrescriptionCard1({super.key});

  _PrescriptionCard1State createState()=> _PrescriptionCard1State();
}

class _PrescriptionCard1State extends State<PrescriptionCard1>{

  int totalAppointments = 36;

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(circularRadius)
      )),
    height: defaultCardHeight * 2/3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text("Pending Appointments\t\t\t", style: GoogleFonts.kanit(
      color: Colors.white,
      fontSize: defaultFontSize,
      fontWeight: FontWeight.w500,
    )),
    Text("${PatientDatabase.pendingAppointments}", style: GoogleFonts.robotoCondensed(
      color: secondaryColor,
      fontSize: defaultFontSize * 2,
      fontWeight: FontWeight.w800,
    ))],),
    );
  }
}

class PrescriptionCard2 extends StatefulWidget{
  const PrescriptionCard2({super.key});

  _PrescriptionCard2State createState()=> _PrescriptionCard2State();
}

class _PrescriptionCard2State extends State<PrescriptionCard2>{

  @override
  Widget build(BuildContext context){
    return Container(
        decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(circularRadius)
        )),
      height: defaultCardHeight * 2/3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Completed Appointments\t\t\t", style: GoogleFonts.kanit(
        color: Colors.white,
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w500,
      )),
      Text("${PatientDatabase.completedAppointments}", style: GoogleFonts.robotoCondensed(
        color: secondaryColor,
        fontSize: defaultFontSize * 2,
        fontWeight: FontWeight.w800,
      ))],),
      );
  }
}

class PrescriptionCard3 extends StatefulWidget{
  const PrescriptionCard3({super.key});

  _PrescriptionCard3State createState()=> _PrescriptionCard3State();
}

class _PrescriptionCard3State extends State<PrescriptionCard3>{

  int completedAppointments = 30;

  @override
  Widget build(BuildContext context){
    return Container(
        decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(circularRadius)
        )),
      height: defaultCardHeight * 2/3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("Cancelled Appointments\t\t\t", style: GoogleFonts.kanit(
        color: Colors.white,
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w500,
      )),
      Text("${PatientDatabase.cancelledAppointments}", style: GoogleFonts.robotoCondensed(
        color: secondaryColor,
        fontSize: defaultFontSize * 2,
        fontWeight: FontWeight.w800,
      ))],),
      );
  }
}


class dashboard extends StatefulWidget{
  final String username;
  
  const dashboard({super.key, required this.username});

  dashboardState createState() => dashboardState();
}

class dashboardState extends State<dashboard>{

  @override
  Widget build(BuildContext){
    return FutureBuilder(future: getDashboard(widget.username), builder: (context, snapshot){
      if(snapshot.hasData){
        return snapshot.data!;
      }else{
        return Center(child: Column(children: [SizedBox(height: 250,),CircularProgressIndicator()]));
      }
    });
  }

  Future<Widget> getDashboard(String username) async{
  await PatientDatabase.instance.initializeCardData(username);
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(
            top: defaultPadding + 20,
            left: defaultPadding,
            right: defaultPadding),
        child: Container(
            height: defaultCardHeight,
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(
                    Radius.circular(circularRadius))),
            child: Greeting(username)),
      ),
    Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.all(Radius.circular(circularRadius)
                )),
              height: defaultCardHeight,
              child: const PatientCard1(),
            )
          ),
          const SizedBox(
            width: defaultPadding
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.all(Radius.circular(circularRadius)
                )),
              height: defaultCardHeight,
              child: const PatientCard2(),
            )
          ),
          const SizedBox(
            width: defaultPadding
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.all(Radius.circular(circularRadius)
                )),
              height: defaultCardHeight,
              child: const PatientCard3(),
            )
          )
        ],),
    ),
    Padding(
      padding: const EdgeInsets.only(left: defaultPadding, right:defaultPadding),
      child: Row(children: [
        const Expanded(
          flex: 2,
          child: Column(
            children: [
              AppointmentCard1(),
              SizedBox(height: defaultPadding,),
              AppointmentCard2(),
              SizedBox(height: defaultPadding-2,),
            ],
          ),
        ),
        const SizedBox(width: defaultPadding,),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              PrescriptionCard1(),
              SizedBox(height: defaultPadding,),
              PrescriptionCard2(),
              SizedBox(height: defaultPadding-2,),
              PrescriptionCard3()
            ],
          ),
        )
      ],),
    )],
  );
}
}

