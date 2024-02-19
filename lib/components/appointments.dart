import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';
import 'database.dart';
import 'models/patient.dart';
import 'models/doctor.dart';
import 'models/appointment.dart';
import 'package:sqflite/sqflite.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  final apptsearchController = TextEditingController();
  final apptsearchby = TextEditingController();
  List<DropdownMenuEntry> patientMenus = [];
  List<DropdownMenuEntry> doctorMenus = [];
  List<String> uniquePatientChecker = [];
  List<String> uniqueDoctorChecker = [];

  Future<List<DataRow>> _appointmentsRowFuture = Future.value([]);

  @override
  void initState() {
    _appointmentsRowFuture = getAppointmentRowData();
    super.initState();
  }

  Future<List<DataRow>> getAppointmentRowData() async {
    List<dynamic> appointments =
        await PatientDatabase.instance.getAppointments();
    List<DataRow> rows = [];
    for (List<dynamic> appointment in appointments) {
      rows.add(DataRow(cells: [
        DataCell(Center(
            child: Text(
          appointment[0].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Center(child: Text(appointment[1].toString()))),
        DataCell(Text(await getDoctorName(
            await PatientDatabase.instance.database,
            appointment[2].toString()))),
        DataCell(Text(await getPatientName(
            await PatientDatabase.instance.database,
            appointment[3].toString()))),
        DataCell(Text(appointment[4].toString())),
        DataCell(Center(
            child: Container(
                child: Center(
                    child: Text(
                  appointment[5].toString(),
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
                )),
                width: 90,
                height: 20,
                decoration: BoxDecoration(
                    color: appointment[5].toString() == "Scheduled" ? Colors.orange.shade400 : 
             appointment[5].toString() == 'Completed' ? Colors.green.shade400 :
             Colors.red.shade300,
                    borderRadius: BorderRadius.circular(circularRadius - 15)))))
      ])
      );
      if (!uniqueDoctorChecker.contains(appointment[2].toString())) {
        uniqueDoctorChecker.add(appointment[2].toString());
        doctorMenus.add(DropdownMenuEntry(
            value: await getDoctorName(await PatientDatabase.instance.database,
                appointment[2].toString()),
            label: await getDoctorName(await PatientDatabase.instance.database,
                appointment[2].toString())));
      }
      if (!uniquePatientChecker.contains(appointment[3].toString())) {
        uniquePatientChecker.add(appointment[3].toString());
        patientMenus.add(DropdownMenuEntry(
            value: await getPatientName(await PatientDatabase.instance.database,
                appointment[3].toString()),
            label: await getPatientName(await PatientDatabase.instance.database,
                appointment[3].toString())));
      }
    }
    return rows;
  }

  void _showAddAppointment(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      builder: (_) => SizedBox(
        height: 340,
        child: Align(alignment: Alignment.center, child: AddAppointmentPage()),
      ),
    );
  }

  Widget AddAppointmentPage() {
    final apptDateController = TextEditingController();
    final patientNameController = TextEditingController();
    final remarksController = TextEditingController();
    final statusController = TextEditingController();
    final doctorNameController = TextEditingController();

    bool apptDate,patientName,remarks,status,doctorName;

    return SizedBox(
        height: double.maxFinite,
        child: Column(
          children: [
            DropdownMenu(
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
                textStyle: GoogleFonts.rubik()),
            TextField(
                controller: apptDateController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_month_outlined),
                  hintText: "Appointment Date (YYYY-MM-DD)",
                ),
                style: GoogleFonts.rubik()),
            DropdownMenu(
                enableFilter: true,
                inputDecorationTheme: InputDecorationTheme(
                    outlineBorder:
                        BorderSide(width: 1, style: BorderStyle.solid)),
                leadingIcon: Icon(Icons.person_2_rounded),
                hintText: "Doctor Name",
                width: 640,
                controller: doctorNameController,
                dropdownMenuEntries: doctorMenus,
                menuHeight: 300,
                textStyle: GoogleFonts.rubik()),
            TextField(
                controller: remarksController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.note_alt),
                  hintText: "Remarks",
                ),
                style: GoogleFonts.rubik()),
            DropdownMenu(
                enableFilter: true,
                inputDecorationTheme: InputDecorationTheme(
                    outlineBorder:
                        BorderSide(width: 1, style: BorderStyle.solid)),
                leadingIcon: Icon(Icons.question_mark_rounded),
                hintText: "Status",
                width: 640,
                controller: statusController,
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 'Scheduled', label: 'Scheduled'),
                  DropdownMenuEntry(value: 'Completed', label: 'Completed'),
                  DropdownMenuEntry(value: 'Cancelled', label: 'Cancelled')
                ],
                menuHeight: 300,
                textStyle: GoogleFonts.rubik()),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  apptDate = apptDateController.text.isEmpty;
                  patientName = patientNameController.text.isEmpty;
                  remarks = remarksController.text.isEmpty;
                  status = statusController.text.isEmpty;
                  doctorName = doctorNameController.text.isEmpty;

                  if (apptDate | patientName | doctorName | remarks | status) {
                    fieldAlert();
                  } else {
                    Database db = await PatientDatabase.instance.database;
                    await insertAppointment(
                        db,
                        patientNameController.text,
                        apptDateController.text,
                        doctorNameController.text,
                        remarksController.text,
                        statusController.text);
                    setState(() {
                      _appointmentsRowFuture = getAppointmentRowData();
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

  Future<List<DataRow>> getFilteredAppointmentRows(String filterType, String searchKey) async {
    List<Map<String, dynamic>> results = await getFilteredAppointments(await PatientDatabase.instance.database, filterType, searchKey);
    List<dynamic> rows = [];
    List<DataRow> dataRows = [];
    for (Map<String, dynamic> appointment in results) {
      rows.add([
        appointment['Appointment_ID'],
        appointment['Appointment_Date'],
        appointment['Doctor_ID'],
        appointment['Patient_ID'],
        appointment['Remarks'],
        appointment['Status'],
      ]);
    }
    for (List<dynamic> appointment in rows) {
      dataRows.add(DataRow(cells: [
        DataCell(Center(
            child: Text(
          appointment[0].toString(),
          style: GoogleFonts.oswald(
              color: primaryColor, fontWeight: FontWeight.w600),
        ))),
        DataCell(Center(child: Text(appointment[1].toString()))),
        DataCell(Center(
            child: Text(await getDoctorName(
                await PatientDatabase.instance.database,
                appointment[2].toString())))),
        DataCell(Center(
            child: Text(
          await getPatientName(await PatientDatabase.instance.database,
              appointment[3].toString()),
        ))),
        DataCell(Center(child: Text(appointment[4].toString()))),
        DataCell(Center(
            child: Container(
                child: Center(
                    child: Text(
                  appointment[5].toString(),
                  style: GoogleFonts.nunito(fontWeight: FontWeight.w500),
                )),
                width: 90,
                height: 20,
                decoration: BoxDecoration(
                    color: appointment[5].toString() == "Scheduled" ? Colors.orange.shade400 : 
             appointment[5].toString() == 'Completed' ? Colors.green.shade400 :
             Colors.red.shade300,
                    borderRadius: BorderRadius.circular(circularRadius - 15)))))
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          ElevatedButton.icon(
            onPressed: () {
              _showAddAppointment(context);
            },
            icon: Icon(
              Icons.person_add,
              color: primaryColor,
              size: 30,
            ),
            label: Text("Add Appointment",
                style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16)),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300, 50),
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
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search Appointments",
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
                    controller: apptsearchController,
                    onChanged: (value) {
                      if (value != "") {
                        setState(() {
                          _appointmentsRowFuture =
                              getFilteredAppointmentRows(apptsearchby.text, value);
                        });
                      } else {
                        setState(() {
                          _appointmentsRowFuture = getAppointmentRowData();
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
                    controller: apptsearchby,
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                          value: 'Patient', label: 'Patient'),
                      DropdownMenuEntry(value: 'Doctor', label: 'Doctor'),
                      DropdownMenuEntry(value: 'Status', label: 'Status'),
                    ]),
              )
            ])),
        FutureBuilder(
            future: _appointmentsRowFuture,
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
                            DataColumn(label: Text('Appointment ID')),
                            DataColumn(label: Text('Appointment Date')),
                            DataColumn(label: Text('Doctor Name')),
                            DataColumn(label: Text('Patient Name')),
                            DataColumn(label: Text('Remarks')),
                            DataColumn(label: Text('Status')),
                          ],
                          rows: snapshot.data!),
                    ),
                  ),
                );
              } else {
                return Container(
                    height: 542,
                    child: Center(child: CircularProgressIndicator()));
              }
              }on TypeError{
                return Container(child: Center(child: Text("No Results Found")),);
              }
            })
      ],
    );
  }
}
