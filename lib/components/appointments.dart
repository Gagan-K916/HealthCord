import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';
import 'database.dart';

void _showAddAppointment(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      builder: (_) => SizedBox(
        height: 340,
        child: Align(
          alignment: Alignment.center,
          child: AddAppointmentPage()),
      ),
    );
  }

class AddAppointmentPage extends StatefulWidget {
  const AddAppointmentPage({super.key});

  AddAppoinmentState createState() => AddAppoinmentState();
}

class AddAppoinmentState extends State<AddAppointmentPage>{
  final apptidController = TextEditingController();
  final patientidController = TextEditingController();
  final patientNameController = TextEditingController();
  final remarksController = TextEditingController();
  final statusController = TextEditingController();
  final doctoridController = TextEditingController();
  final doctorNameController = TextEditingController();

  String? apptid, patientid, patientName, remarks, status, doctorid, doctorName; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Column(
        children: [
          TextField(
            controller: apptidController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.numbers_rounded),
              hintText: "Appointment ID",
              ),
              style: GoogleFonts.rubik()
          ),
            DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(outlineBorder: BorderSide(width: 1, style: BorderStyle.solid)),
              leadingIcon: Icon(Icons.person_2_rounded),
              hintText: "Patient Name",
              width: 640,
              controller: patientNameController,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Patient 1', label: 'Patient 1')
              ],
              textStyle: GoogleFonts.rubik()),
            TextField(
              controller: remarksController ,
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.note_alt),
              hintText: "Remarks",
              ),
              style: GoogleFonts.rubik()
            ),
            TextField(
            controller: statusController ,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.question_mark_rounded),
              hintText: "Status",
              ),
              style: GoogleFonts.rubik()
            ),
            DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(outlineBorder: BorderSide(width: 1, style: BorderStyle.solid)),
              leadingIcon: Icon(Icons.person_2_rounded),
              hintText: "Doctor Name",
              width: 640,
              controller: doctorNameController,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Shastry', label: 'Shastry')
              ],
              textStyle: GoogleFonts.rubik()),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              apptid = apptidController.text;
              patientid = patientidController.text;
              patientName = patientNameController.text;
              remarks = remarksController.text;
              status = statusController.text;
              doctorid = doctoridController.text;
              doctorName = doctorNameController.text;
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
}

class Appointments extends StatefulWidget{

  const Appointments({super.key});

  _AppointmentsState createState()=> _AppointmentsState();
}

class _AppointmentsState extends State<Appointments>{
  final apptsearchController = TextEditingController();
  final apptsearchby = TextEditingController();

  Future<List<DataRow>> _appointmentsRowFuture = Future.value([]);

  @override
  void initState() {
    _appointmentsRowFuture = getAppointmentRowData();
    super.initState();  
  }

  Future<List<DataRow>> getAppointmentRowData() async{
    List<dynamic> appointments = await PatientDatabase.instance.getAppointments();
    List<DataRow> rows = [];
    for(List<dynamic> appointment in appointments){
      rows.add(DataRow(cells: [
        DataCell(Text(appointment[0].toString())),
        DataCell(Text(appointment[1].toString())),
        DataCell(Text(appointment[2].toString())),
        DataCell(Text(appointment[3].toString())),
        DataCell(Text(appointment[4].toString()))
      ]));
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
              _showAddAppointment(context);
            }, 
            icon: Icon(Icons.person_add, color: primaryColor ,size: 30,), 
            label: Text("Add Appointment", style: GoogleFonts.poppins(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 16)),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(300,50),
              backgroundColor: Colors.grey.shade100,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(circularRadius - 10))
              ),
            ),), const SizedBox(width: defaultPadding,)]),
    Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        Flexible(
          flex: 5,
          fit: FlexFit.loose,
          child: TextField(
          decoration: InputDecoration(hintText: "Search Appointments",prefixIcon: Icon(Icons.search_rounded, color: primaryColor,)
          ,enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15))),
          controller: apptsearchController,
          onChanged: (value) {}// The table filtering widget,
                ),
        ),
        const SizedBox(width: defaultPadding,),
        Text("Search By", style: GoogleFonts.robotoCondensed(color: primaryColor, fontWeight: FontWeight.w800, fontSize: 16),),
        SizedBox(width: defaultPadding),
      Flexible(
        fit: FlexFit.loose,
        flex: 2,
        child: DropdownMenu(
          controller: apptsearchby,
          dropdownMenuEntries: [
          DropdownMenuEntry(value: 'Appointment ID', label: 'Appointment ID'),
          DropdownMenuEntry(value: 'Patient ID', label: 'Patient ID'),
          DropdownMenuEntry(value: 'Patient Name', label: 'Patient Name'),
          DropdownMenuEntry(value: 'Doctor ID', label: 'Doctor ID'),
          DropdownMenuEntry(value: 'Doctor Name', label: 'Doctor Name'),
          ]),
      )]
    )
  )
    , 
    FutureBuilder(
      future: _appointmentsRowFuture, 
      builder: (context, snapshot){
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
                  DataColumn(label: Text('Appointment ID')),
                  DataColumn(label: Text('Doctor ID')),
                  DataColumn(label: Text('Patient ID')),
                  DataColumn(label: Text('Remarks')),
                  DataColumn(label: Text('Status')),
                ], rows: snapshot.data!
                ),
              ),
            ),
          );
        }else{
          return Container(height: 542,child: Center(child: CircularProgressIndicator()));
        }
      })],
    
  );
}
}
