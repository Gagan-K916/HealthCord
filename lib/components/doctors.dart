import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/components/database.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';
import 'package:sqflite/sqflite.dart';
import 'models/doctor.dart';


class Doctors extends StatefulWidget {
  const Doctors({super.key});

  DoctorsState createState() => DoctorsState();
}

class DoctorsState extends State<Doctors> {
  final docsearchController = TextEditingController();

  Future<List<DataRow>> doctorsRowFuture = Future.value([]);

  void _showAddDoctor(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (_) => Container(
        height: 410,
        child:
            Align(alignment: Alignment.center, child: addDoctorPage(context)),
      ),
    );
  }
  

  
  Widget addDoctorPage(BuildContext context) {
    final specializationController = TextEditingController();
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
                controller: specializationController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.cake_rounded),
                  hintText: "Specialization",
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
                  bool specializationCheck = specializationController.text.isEmpty;
                  
                  if(fNameCheck | genderCheck | emailCheck | specializationCheck){
                    fieldAlert();
                  }else{
                  Database db = await PatientDatabase.instance.database;
                  await insertDoctor(
                      db,
                      fNameController.text,
                      lNameController.text,
                      genderController.text,
                      emailController.text,
                      phoneController.text,
                      specializationController.text);
                  setState(() {
                    doctorsRowFuture = getDoctorRowData();
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
      doctorsRowFuture = getDoctorRowData();
    });
  }

  @override
  void initState() {
    doctorsRowFuture = getDoctorRowData();
    super.initState();
  }

  Future<List<DataRow>> getDoctorRowData() async {
    
    List<dynamic> doctors = await PatientDatabase.instance.getDoctors();
    List<DataRow> rows = [];
    for (List<dynamic> doctor in doctors) {
      rows.add(DataRow(cells: [
        DataCell(Center(
            child: Text(
          doctor[0].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Center(child: Text(doctor[1].toString()))),
        DataCell(Center(child: Text(doctor[2].toString()))),
        DataCell(Center(
            child: Text(
          doctor[3].toString(),
        ))),
        DataCell(Center(child: Text(doctor[4].toString()))),
        DataCell(Center(
            child: Container(
                child: Center(
                    child: Text(
                  doctor[5].toString(),
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
                )),
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: doctor[5].toString() == "Male"
                        ? Colors.blue.shade300
                        : Colors.pink.shade200,
                    borderRadius: BorderRadius.circular(circularRadius - 15))))),
        DataCell(Center(child: Text(doctor[6].toString()))),
        
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
  Future<List<DataRow>> getFilteredDoctorRows(String searchKey) async{
    List<Map<String, dynamic>> results = await getFilteredDoctors(await PatientDatabase.instance.database, searchKey);
    List<dynamic> rows = [];
    List<DataRow> dataRows = [];
    for (Map<String, dynamic> doctor in results){
      rows.add(
        [
        doctor['Doctor_ID'],
        doctor['First_Name'],
        doctor['Last_Name'],
        doctor['Email'],
        doctor['Phone'],
        doctor['Gender'],
        doctor['Specialization']
      ]
      );
    }
    for (List<dynamic> doctor in rows) {
      dataRows.add(DataRow(cells: [
        DataCell(Center(
            child: Text(
          doctor[0].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Center(child: Text(doctor[1].toString()))),
        DataCell(Center(child: Text(doctor[2].toString()))),
        DataCell(Center(
            child: Text(
          doctor[3].toString(),
        ))),
        DataCell(Center(child: Text(doctor[4].toString()))),
        DataCell(Center(
            child: Container(
                child: Center(
                    child: Text(
                  doctor[5].toString(),
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
                )),
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                    color: doctor[5].toString() == "Male"
                        ? Colors.blue.shade300
                        : Colors.pink.shade200,
                    borderRadius: BorderRadius.circular(circularRadius - 15))))),
        DataCell(Center(child: Text(doctor[6].toString()))),
        
      ]));
    }
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        //   ElevatedButton.icon(
        //     onPressed: () {
        //       _showAddDoctor(context);
        //     },
        //     icon: Icon(
        //       Icons.person_add,
        //       color: primaryColor,
        //       size: 30,
        //     ),
        //     label: Text("Add Doctor",
        //         style: GoogleFonts.poppins(
        //             color: primaryColor,
        //             fontWeight: FontWeight.w500,
        //             fontSize: 16)),
        //     style: ElevatedButton.styleFrom(
        //       fixedSize: Size(200, 50),
        //       backgroundColor: Colors.grey.shade100,
        //       shape: const RoundedRectangleBorder(
        //           borderRadius:
        //               BorderRadius.all(Radius.circular(circularRadius - 10))),
        //     ),
        //   ),
        //   const SizedBox(
        //     width: defaultPadding,
        //   )
        // ]),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Doctor",
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
              controller: docsearchController,
              onChanged: (value) {
                if (value!= ""){
                  setState((){
                    doctorsRowFuture = getFilteredDoctorRows(value);
                  });
                }else{
                  setState(() {
                    doctorsRowFuture = getDoctorRowData();
                  });
                }
              } // The table filtering widget,
              ),
        ),
        FutureBuilder(
            future: doctorsRowFuture,
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
                                label: Center(child: Text('Doctor ID'))),
                            DataColumn(
                                label: Center(child: Text('First Name'))),
                            DataColumn(label: Center(child: Text('Last Name'))),
                            DataColumn(label: Center(child: Text('Email'))),
                            DataColumn(label: Center(child: Text('Phone'))),
                            DataColumn(
                                label: Center(child: Text('Gender'))),
                            DataColumn(label: Center(child: Text('Specialization')))
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
