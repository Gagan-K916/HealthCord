import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/components/database.dart';
import 'package:healthcord/components/models/patient.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';
import 'package:sqflite/sqflite.dart';

class patients extends StatefulWidget {
  const patients({super.key});

  PatientsState createState() => PatientsState();
}

class PatientsState extends State<patients> {
  final searchController = TextEditingController();

  Future<List<DataRow>> patientsRowFuture = Future.value([]);

  void _showAddPatient(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (_) => Container(
        height: 410,
        child:
            Align(alignment: Alignment.center, child: addPatientPage(context)),
      ),
    );
  }
  

  
  Widget addPatientPage(BuildContext context) {
    final dobController = TextEditingController();
    final emailController = TextEditingController();
    final fNameController = TextEditingController();
    final genderController = TextEditingController();
    final lNameController = TextEditingController();
    final phoneController = TextEditingController();
    return SizedBox(
        height: double.maxFinite,
        child: Column(
          children: [
            TextField(
              controller: fNameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.perm_identity_outlined),
                hintText: "First Name",
              ),
              style: GoogleFonts.rubik(),
            ),
            TextField(
                controller: lNameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity_outlined),
                  hintText: "Last Name",
                ),
                style: GoogleFonts.rubik()),
            DropdownMenu(
                inputDecorationTheme: InputDecorationTheme(
                    outlineBorder:
                        BorderSide(width: 1, style: BorderStyle.solid)),
                leadingIcon: Icon(Icons.male_rounded),
                hintText: "Gender",
                width: 640,
                controller: genderController,
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'Male', label: 'Male'),
                  DropdownMenuEntry(value: 'Female', label: 'Female')
                ],
                textStyle: GoogleFonts.rubik()),
            TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded),
                  hintText: "Email",
                ),
                style: GoogleFonts.rubik()),
            TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_in_talk_sharp),
                  hintText: "Phone",
                ),
                style: GoogleFonts.rubik()),
            TextField(
                controller: dobController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.cake_rounded),
                  hintText: "Date of Birth (YYYY-MM-DD)",
                ),
                style: GoogleFonts.rubik()),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  bool fNameCheck = fNameController.text.isEmpty;
                  bool genderCheck = genderController.text.isEmpty;
                  bool emailCheck = emailController.text.isEmpty;
                  bool dobCheck = dobController.text.isEmpty;
                  
                  if(fNameCheck | genderCheck | emailCheck | dobCheck){
                    fieldAlert();
                  }else{
                  Database db = await PatientDatabase.instance.database;
                  await insertPatient(
                      db,
                      fNameController.text,
                      lNameController.text,
                      genderController.text,
                      emailController.text,
                      phoneController.text,
                      dobController.text);
                  setState(() {
                    patientsRowFuture = getPatientRowData();
                  });
                  Navigator.pop(context);
                }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    fixedSize: Size(200, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(circularRadius - 10)))),
                child: Text(
                  "ADD",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ))
          ],
        ));
  }

  void refreshTable() {
    setState(() {
      patientsRowFuture = getPatientRowData();
    });
  }

  @override
  void initState() {
    patientsRowFuture = getPatientRowData();
    super.initState();
  }

  Future<List<DataRow>> getPatientRowData() async {
    List<dynamic> patients = await PatientDatabase.instance.getPatients();
    List<DataRow> rows = [];
    for (List<dynamic> patient in patients) {
      rows.add(DataRow(cells: [
        DataCell(Center(
            child: Text(
          patient[0].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Center(child: Text(patient[1].toString()))),
        DataCell(Center(child: Text(patient[2].toString()))),
        DataCell(Center(
            child: Text(
          patient[3].toString(),
        ))),
        DataCell(Center(child: Text(patient[4].toString()))),
        DataCell(Center(child: Text(patient[5].toString()))),
        DataCell(Center(
            child: Container(
                child: Center(
                    child: Text(
                  patient[6].toString(),
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
                )),
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: patient[6].toString() == "Male"
                        ? Colors.blue.shade300
                        : Colors.pink.shade200,
                    borderRadius: BorderRadius.circular(circularRadius - 15)))))
      ]));
    }
    return rows;
  }
  void fieldAlert(){
    showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Text('WARNING!', style: GoogleFonts.poppins(color: Colors.red.shade600, fontSize: 19, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
      content: Text('Please fill all the fields', style: GoogleFonts.poppins(color: primaryColor, fontSize: 15, fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(circularRadius))
    ),
  );
  }
  Future<List<DataRow>> getFilteredPatientRows(String searchKey) async{
    List<Map<String, dynamic>> results = await getFilteredPatients(await PatientDatabase.instance.database, searchKey);
    List<dynamic> rows = [];
    List<DataRow> dataRows = [];
    for (Map<String, dynamic> patient in results){
      rows.add(
        [
        patient['Patient_ID'],
        patient['First_Name'],
        patient['Last_Name'],
        patient['Email'],
        patient['Phone'],
        patient['DOB'],
        patient['Gender']
      ]
      );
    }
    for (List<dynamic> patient in rows) {
      dataRows.add(DataRow(cells: [
        DataCell(Center(
            child: Text(
          patient[0].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Center(child: Text(patient[1].toString()))),
        DataCell(Center(child: Text(patient[2].toString()))),
        DataCell(Center(
            child: Text(
          patient[3].toString(),
        ))),
        DataCell(Center(child: Text(patient[4].toString()))),
        DataCell(Center(child: Text(patient[5].toString()))),
        DataCell(Center(
            child: Container(
                child: Center(
                    child: Text(
                  patient[6].toString(),
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
                )),
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: patient[6].toString() == "Male"
                        ? Colors.blue.shade300
                        : Colors.pink.shade200,
                    borderRadius: BorderRadius.circular(circularRadius - 15)))))
      ]));
    }
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          ElevatedButton.icon(
            onPressed: () {
              _showAddPatient(context);
            },
            icon: Icon(
              Icons.person_add,
              color: primaryColor,
              size: 30,
            ),
            label: Text("Add Patient",
                style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16)),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200, 50),
              backgroundColor: Colors.grey.shade100,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(circularRadius - 10))),
            ),
          ),
          const SizedBox(
            width: defaultPadding,
          )
        ]),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Patient",
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
              controller: searchController,
              onChanged: (value) {
                if (value!= ""){
                  setState((){
                    patientsRowFuture = getFilteredPatientRows(value);
                  });
                }else{
                  setState(() {
                    patientsRowFuture = getPatientRowData();
                  });
                }
              } // The table filtering widget,
              ),
        ),
        FutureBuilder(
            future: patientsRowFuture,
            builder: (context, snapshot) {
              try{
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  height: 542,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(circularRadius),
                    child: SingleChildScrollView(
                      child: DataTable(
                          headingRowColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            return primaryColor;
                          }),
                          headingTextStyle: TextStyle(color: Colors.white),
                          border: TableBorder.all(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.circular(circularRadius)),
                          columns: const [
                            DataColumn(
                                label: Center(child: Text('Patient ID'))),
                            DataColumn(
                                label: Center(child: Text('First Name'))),
                            DataColumn(label: Center(child: Text('Last Name'))),
                            DataColumn(label: Center(child: Text('Email'))),
                            DataColumn(label: Center(child: Text('Phone'))),
                            DataColumn(
                                label: Center(child: Text('Date of Birth'))),
                            DataColumn(label: Center(child: Text('Gender')))
                          ],
                          rows: snapshot.data!),
                    ),
                  ),
                );
              } else {
                return Container(
                    height: 542,
                    child: Center(child: CircularProgressIndicator()));
              }}on TypeError{
                return Container(child: Center(child: Text("No Results Found")),);
              }
            }),
      ],
    );
  }
}
