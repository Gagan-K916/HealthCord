import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';
import 'database.dart';
import 'package:sqflite/sqflite.dart';
import 'models/prescription.dart';
import 'models/doctor.dart';
import 'models/patient.dart';


class Prescriptions extends StatefulWidget{
  final String username;

  const Prescriptions({super.key, required this.username});

  _PrescriptionsState createState()=> _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions>{
  final prescsearchController = TextEditingController();
  final presFilterController = TextEditingController();
  List<DropdownMenuEntry> patientMenus = [];
  List<DropdownMenuEntry> doctorMenus = [];
  List<DropdownMenuEntry> apptidMenus = [];
  List<String> uniquePatientChecker = [];
  List<String> uniqueDoctorChecker = [];

  Future<List<DataRow>> _prescriptionsRowFuture = Future.value([]);

  void _showAddPrescription(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      builder: (_) => SizedBox(
        height: 380,
        child: Align(alignment: Alignment.center, child: AddPrescriptionPage())
    ));
  }

  Future<List<DropdownMenuEntry>> patientMenuDropDowns() async{
    List<dynamic> patients = await PatientDatabase.instance.getPatients(widget.username);
    for (List<dynamic> patient in patients) {
    if (!uniquePatientChecker.contains(patient[0].toString())) {
        uniquePatientChecker.add(patient[0].toString());
        patientMenus.add(DropdownMenuEntry(
            value: await getPatientName(await PatientDatabase.instance.database,
                patient[0].toString()),
            label: await getPatientName(await PatientDatabase.instance.database,
                patient[0].toString())));
      }
    }
    return patientMenus;
  }

  Future<List<DropdownMenuEntry>> appointmentMenuDropdowns() async{
    List<dynamic> appointments = await PatientDatabase.instance.getAppointments(widget.username);
    for (List<dynamic> appointment in appointments) {
    if (!uniquePatientChecker.contains(appointment[0].toString())) {
        uniquePatientChecker.add(appointment[0].toString());
        apptidMenus.add(DropdownMenuEntry(
            value: await getPatientName(await PatientDatabase.instance.database,
                appointment[0].toString()),
            label: await getPatientName(await PatientDatabase.instance.database,
                appointment[0].toString())));
      }
    }
    return apptidMenus;
  }


  Widget AddPrescriptionPage(){
  final patientNameController = TextEditingController();
  final apptidController = TextEditingController();
  final medicationController = TextEditingController();
  final dosageController = TextEditingController();
  final frequencyController = TextEditingController();
  final doctorNameController = TextEditingController();

  return SizedBox(
    height: double.maxFinite,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          FutureBuilder(
              future: appointmentMenuDropdowns(),
              builder: ((context, snapshot) {
                if(snapshot.hasData){
                return DropdownMenu(
                  enableFilter: true,
                  inputDecorationTheme: InputDecorationTheme(
                      outlineBorder:
                          BorderSide(width: 1, style: BorderStyle.solid)),
                  leadingIcon: Icon(Icons.numbers_outlined),
                  hintText: "Appointment ID",
                  width: 640,
                  controller: apptidController,
                  dropdownMenuEntries: apptidMenus,
                  menuHeight: 200,
                  textStyle: GoogleFonts.rubik());
                }else{return DropdownMenu(
                  enableFilter: true,
                  inputDecorationTheme: InputDecorationTheme(
                      outlineBorder:
                          BorderSide(width: 1, style: BorderStyle.solid)),
                  leadingIcon: Icon(Icons.numbers_outlined),
                  hintText: "Appointment ID",
                  width: 640,
                  controller: apptidController,
                  dropdownMenuEntries: apptidMenus,
                  menuHeight: 200,
                  textStyle: GoogleFonts.rubik());}
              }),
            ),
          FutureBuilder(
              future: patientMenuDropDowns(),
              builder: ((context, snapshot) {
                if(snapshot.hasData){
                return DropdownMenu(
                  enableFilter: true,
                  inputDecorationTheme: InputDecorationTheme(
                      outlineBorder:
                          BorderSide(width: 1, style: BorderStyle.solid)),
                  leadingIcon: Icon(Icons.person_2_rounded),
                  hintText: "Patient Name",
                  width: 640,
                  controller: patientNameController,
                  dropdownMenuEntries: patientMenus,
                  menuHeight: 200,
                  textStyle: GoogleFonts.rubik());
                }else{return DropdownMenu(
                  enableFilter: true,
                  inputDecorationTheme: InputDecorationTheme(
                      outlineBorder:
                          BorderSide(width: 1, style: BorderStyle.solid)),
                  leadingIcon: Icon(Icons.person_2_rounded),
                  hintText: "Patient Name",
                  width: 640,
                  controller: patientNameController,
                  dropdownMenuEntries: patientMenus,
                  menuHeight: 200,
                  textStyle: GoogleFonts.rubik());}
              }),
            ),
            DropdownMenu(
                enableFilter: true,
                inputDecorationTheme: InputDecorationTheme(
                    outlineBorder:
                        BorderSide(width: 1, style: BorderStyle.solid)),
                leadingIcon: Icon(Icons.person_2_rounded),
                hintText: "Doctor Name",
                width: 640,
                controller: doctorNameController,
                dropdownMenuEntries: widget.username == "Admin" ? doctorMenus : [DropdownMenuEntry(value: widget.username, label: widget.username)],
                menuHeight: 300,
                textStyle: GoogleFonts.rubik()),
          TextField(
            controller: medicationController ,
            decoration: InputDecoration(
            prefixIcon: Icon(Icons.medical_information),
            hintText: "Medication",
            ),
          ),
          TextField(
          controller: dosageController ,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.monitor_heart_outlined),
            hintText: "Dosage",
            ),
          ),
          TextField(
          controller: frequencyController ,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.format_list_numbered_sharp),
            hintText: "Frequency",
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()async {
            if (apptidController.text.isEmpty | patientNameController.text.isEmpty | doctorNameController.text.isEmpty | medicationController.text.isEmpty) {
              fieldAlert();
            } else{
              Database db = await PatientDatabase.instance.database;
              await insertPrescription(
                  db,
                  apptidController.text,
                  patientNameController.text,
                  doctorNameController.text,
                  medicationController.text,
                  dosageController.text,
                  frequencyController.text);
              setState(() {
                _prescriptionsRowFuture = getPrescriptionRowData();
              });
              Navigator.pop(context);
            }
          }, 
          style:ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
              fixedSize: Size(200,50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(circularRadius - 10)))),
          child: Text("ADD", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),))
      ],
    )
  );
}

Future<List<DataRow>> getFilteredPrescriptionRows(String filterType, String searchKey) async {
    List<Map<String, dynamic>> results = await getFilteredPrescriptions(await PatientDatabase.instance.database, filterType, searchKey);
    print(results);
    List<dynamic> rows = [];
    List<DataRow> dataRows = [];
    for (Map<String, dynamic> prescription in results) {
      rows.add([
        prescription['Presc_ID'],
        prescription['Doctor_ID'],
        prescription['Patient_ID'],
        prescription['Appointment_ID'],
        prescription['Medication'],
        prescription['Dosage'],
        prescription['Frequency']
      ]);
    }
    for (List<dynamic> prescription in rows) {
      dataRows.add(DataRow(cells: [
        DataCell(Center(
            child: Text(
          prescription[0].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Text(await getDoctorName(
            await PatientDatabase.instance.database,
            prescription[1].toString()))),
        DataCell(Text(await getPatientName(await PatientDatabase.instance.database,
              prescription[2].toString()))),
        DataCell(Center(
            child: Text(
          prescription[3].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Center(child: Text(prescription[4].toString()))),
        DataCell(Center(child: Text(prescription[5].toString()))),
        DataCell(Center(child: Text(prescription[6].toString()))),
      ]));
    }
    return dataRows;
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
            'Please fill all the fields',
            style: GoogleFonts.poppins(
                color: primaryColor, fontSize: 15, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(circularRadius))),
    );
  }

  @override
  void initState() {
    _prescriptionsRowFuture = getPrescriptionRowData();
    super.initState();  
  }

  Future<List<DataRow>> getPrescriptionRowData() async{
    List<dynamic> prescriptions = await PatientDatabase.instance.getPrescriptions(widget.username);
    List<DataRow> rows = [];
    for(List<dynamic> prescription in prescriptions){
      rows.add(DataRow(cells: [
        DataCell(Center(
            child: Text(
          prescription[0].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Text(await getDoctorName(
            await PatientDatabase.instance.database,
            prescription[1].toString()))),
        DataCell(Text(await getPatientName(await PatientDatabase.instance.database,
              prescription[2].toString()))),
        DataCell(Center(
            child: Text(
          prescription[3].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Text(prescription[4].toString())),
        DataCell(Text(prescription[5].toString())),
        DataCell(Text(prescription[6].toString()))
      ]));

      if (!uniqueDoctorChecker.contains(prescription[2].toString())) {
        uniqueDoctorChecker.add(prescription[1].toString());
        doctorMenus.add(DropdownMenuEntry(
            value: await getDoctorName(await PatientDatabase.instance.database,
                prescription[1].toString()),
            label: await getDoctorName(await PatientDatabase.instance.database,
                prescription[1].toString())));
      }
    }
    return rows;
  }


  @override
  Widget build(BuildContext context){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton.icon(
            onPressed: (){
              _showAddPrescription(context);
            }, 
            icon: Icon(Icons.person_add, color: primaryColor ,size: 30,), 
            label: Text("Assign Prescription", style: GoogleFonts.poppins(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 16)),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300,50),
              backgroundColor: Colors.grey.shade100,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(circularRadius - 10))
              ),
            ),), const SizedBox(width: defaultPadding,)]),
    Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search Prescriptions",
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: primaryColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15))),
                    controller: prescsearchController,
                    onChanged: (value) {
                      if (value != "") {
                        setState(() {
                          _prescriptionsRowFuture =
                              getFilteredPrescriptionRows(presFilterController.text, value);
                        });
                      } else {
                        setState(() {
                          _prescriptionsRowFuture = getPrescriptionRowData();
                        });
                      }
                    } // The table filtering widget,
                    ),
              ),
              const SizedBox(
                width: defaultPadding + 5,
              ),
              Text(
                "Filter By",
                style: GoogleFonts.robotoCondensed(
                    color: primaryColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 16),
              ),
              SizedBox(width: defaultPadding),
              Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child: DropdownMenu(
                    controller: presFilterController,
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                          value: 'Patient', label: 'Patient'),
                      DropdownMenuEntry(value: 'Doctor', label: 'Doctor'),
                      DropdownMenuEntry(value: 'Medication', label: 'Medication'),
                    ]),
              )
            ])),
    FutureBuilder(
      future: _prescriptionsRowFuture, 
      builder: (context, snapshot){
        try{
        if (snapshot.connectionState == ConnectionState.done){
          return Container(
            height: 542,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(circularRadius),
              child:
              SingleChildScrollView(
                child: DataTable(
                  headingRowColor: 
                MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return primaryColor; 
                    }
                  ),
                  headingTextStyle: TextStyle(color: Colors.white),
                  border: TableBorder.all(color: Colors.grey, borderRadius: BorderRadius.circular(circularRadius)),
                  columns: const [
                  DataColumn(label: Text('Prescription ID')),
                  DataColumn(label: Text('Doctor')),
                  DataColumn(label: Text('Patient')),
                  DataColumn(label: Text('Appointment ID')),
                  DataColumn(label: Text('Medication')),
                  DataColumn(label: Text('Dosage')),
                  DataColumn(label: Text('Frequency')),
                ], rows: snapshot.data!
                ),
              ),
            ),
          );
        }else{
          return Container(height: 542,child: Center(child: CircularProgressIndicator()));
        }
        }on TypeError{
          return Container(child: Text('No Results Found'),);
        }
      })],
    
  );
}
}
