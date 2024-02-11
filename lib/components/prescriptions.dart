import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';
import 'database.dart';

void _showAddPrescription(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      builder: (_) => Align(
        alignment: Alignment.center,
        child: AddPrescriptionPage()),
    );
  }

class AddPrescriptionPage extends StatefulWidget {
  const AddPrescriptionPage({super.key});

  AddPrescriptionState createState() => AddPrescriptionState();
}

class AddPrescriptionState extends State<AddPrescriptionPage>{
  final prescidController = TextEditingController();
  final patientNameController = TextEditingController();
  final apptidController = TextEditingController();
  final medicationController = TextEditingController();
  final dosageController = TextEditingController();
  final frequencyController = TextEditingController();
  final doctorNameController = TextEditingController();

  String? apptid, prescid, patientName, medication, dosage, frequency, doctorName; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: prescidController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.numbers_rounded),
              hintText: "Prescription ID",
              ),
          ),
            DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(outlineBorder: BorderSide(width: 1, style: BorderStyle.solid)),
              leadingIcon: Icon(Icons.numbers_rounded),
              hintText: "Appointment ID",
              width: 640,
              controller: apptidController,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: '1', label: '1'),
                DropdownMenuEntry(value: '2', label: '2')
              ],),
            DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(outlineBorder: BorderSide(width: 1, style: BorderStyle.solid)),
              leadingIcon: Icon(Icons.person_2_rounded),
              hintText: "Patient Name",
              width: 640,
              controller: patientNameController,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Patient1', label: 'Patient1')
              ],),
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
            DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(outlineBorder: BorderSide(width: 1, style: BorderStyle.solid)),
              leadingIcon: Icon(Icons.person_2_rounded),
              hintText: "Doctor Name",
              width: 640,
              controller: doctorNameController,
              dropdownMenuEntries: [
                DropdownMenuEntry(value: 'Shastry', label: 'Shastry')
              ],),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              apptid = prescidController.text;
              patientName = patientNameController.text;
              apptid = apptidController.text;
              medication = medicationController.text;
              dosage = dosageController.text;
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

class Prescriptions extends StatefulWidget{

  const Prescriptions({super.key});

  _PrescriptionsState createState()=> _PrescriptionsState();
}

class _PrescriptionsState extends State<Prescriptions>{
  final prescsearchController = TextEditingController();

  Future<List<DataRow>> _prescriptionsRowFuture = Future.value([]);

  @override
  void initState() {
    _prescriptionsRowFuture = getPrescriptionRowData();
    super.initState();  
  }

  Future<List<DataRow>> getPrescriptionRowData() async{
    List<dynamic> prescriptions = await PatientDatabase.instance.getPrescriptions();
    List<DataRow> rows = [];
    for(List<dynamic> prescription in prescriptions){
      rows.add(DataRow(cells: [
        DataCell(Text(prescription[0].toString())),
        DataCell(Text(prescription[1].toString())),
        DataCell(Text(prescription[2].toString())),
        DataCell(Text(prescription[3].toString())),
        DataCell(Text(prescription[4].toString())),
        DataCell(Text(prescription[5].toString())),
        DataCell(Text(prescription[6].toString()))
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
      child: TextField(
        decoration: InputDecoration(hintText: "Search Prescriptions",prefixIcon: Icon(Icons.search_rounded, color: primaryColor,)
        ,enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15))),
        controller: prescsearchController,
        onChanged: (value) {}// The table filtering widget,
      ),
    )
    , 
    FutureBuilder(
      future: _prescriptionsRowFuture, 
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
                  DataColumn(label: Text('Prescription ID')),
                  DataColumn(label: Text('Doctor ID')),
                  DataColumn(label: Text('Patient ID')),
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
      })],
    
  );
}
}
