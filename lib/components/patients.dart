import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcord/components/database.dart';
import 'package:healthcord/constants/app_colors.dart';
import 'package:healthcord/constants/measures.dart';

void _showAddPatient(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      builder: (_) => Align(
        alignment: Alignment.center,
        child: AddPatientPage()),
    );
  }

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({super.key});

  AddPatientState createState() => AddPatientState();
}

class AddPatientState extends State<AddPatientPage>{
  String? id, fName, lName, email, phone, gender, dob;
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final fNameController = TextEditingController();
  final genderController = TextEditingController();
  final idController = TextEditingController();
  final lNameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Column(
        children: [
          TextField(
            controller: idController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.numbers_rounded),
              hintText: "Patient ID",
              ),
          ),
            TextField(
            controller: fNameController ,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.perm_identity_outlined),
              hintText: "First Name",
              ),
            ),
            TextField(
              controller: lNameController ,
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.perm_identity_outlined),
              hintText: "Last Name",
              ),
            ),
            TextField(
              controller: lNameController ,
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.male_rounded),
              hintText: "Gender",
              ),
            ),
            TextField(
            controller: emailController ,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_rounded),
              hintText: "Email",
              ),
            ),
            TextField(
            controller: phoneController ,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.phone_in_talk_sharp),
              hintText: "Phone",
              ),
            ),
            TextField(
            controller: dobController ,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.cake_rounded),
              hintText: "Date of Birth",
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              id = idController.text;
              fName = fNameController.text;
              lName = lNameController.text;
              email = emailController.text;
              phone = phoneController.text;
              gender = genderController.text;
              dob = dobController.text;
              print("$fName $lName");
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

class patients extends StatefulWidget{
  const patients({super.key});

  _PatientsState createState()=> _PatientsState();
}

class _PatientsState extends State<patients>{
  final searchController = TextEditingController();

  Future<List<DataRow>> _patientsRowFuture = Future.value([]);


  @override
  void initState() {
    _patientsRowFuture = getPatientRowData();
    super.initState();  
  }

  Future<List<DataRow>> getPatientRowData() async{
    List<dynamic> patients = await PatientDatabase.instance.getPatients();
    List<DataRow> rows = [];
    for(List<dynamic> patient in patients){
      rows.add(DataRow(cells: [
        DataCell(Text(patient[0].toString())),
        DataCell(Text(patient[1].toString())),
        DataCell(Text(patient[2].toString())),
        DataCell(Text(patient[3].toString())),
        DataCell(Text(patient[4].toString())),
        DataCell(Text(patient[5].toString())),
        DataCell(Text(patient[6].toString()))
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
              _showAddPatient(context);
            }, 
            icon: Icon(Icons.person_add, color: primaryColor ,size: 30,), 
            label: Text("Add Patient", style: GoogleFonts.poppins(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 16)),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(200,50),
              backgroundColor: Colors.grey.shade100,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(circularRadius - 10))
              ),
            ),), const SizedBox(width: defaultPadding,)]),
    Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: TextField(
        decoration: InputDecoration(hintText: "Search Patient",prefixIcon: Icon(Icons.search_rounded, color: primaryColor,)
        ,enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15))),
        controller: searchController,
        onChanged: (value) {}// The table filtering widget,
      ),
    )
    ,
    FutureBuilder(
      future: _patientsRowFuture, 
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
                  DataColumn(label: Text('Patient ID')),
                  DataColumn(label: Text('First Name')),
                  DataColumn(label: Text('Last Name')),
                  DataColumn(label: Text('Gender')),
                  DataColumn(label: Text('Date of Birth')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Phone')),
                ], rows: snapshot.data!
                ),
              ),
            ),
          );
        }else{
          return Container(height: 542,child: Center(child: CircularProgressIndicator()));
        }
      })
  ,
    ],
    
  );
}
}
