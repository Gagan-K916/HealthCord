import 'package:healthcord/components/models/appointment.dart';
import 'package:healthcord/components/models/doctor.dart';
import 'package:healthcord/components/models/prescription.dart';
import 'package:healthcord/components/models/relationship.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart' as sqfliteFfi_web;
import 'models/patient.dart';
import 'dart:html' as html;

class PatientDatabase {
  int tableCount  = 0;
  PatientDatabase._init(){
    // Initialize sqflite for web
    databaseFactory = sqfliteFfi_web.databaseFactoryFfiWeb;
  }

  static final PatientDatabase instance = PatientDatabase._init();
  static Database? _database;
  static String totalNoOfPatients = '';
  static String noOfMalePatients = '';
  static String noOfFemalePatients = '';
  static String totalAppointments= '';
  static String totalPrescriptions = '';
  static String pendingAppointments = '';
  static String completedAppointments = '';
  static String cancelledAppointments = '';

  Future<Database> get database async {
    if(_database != null){
    tableCount = firstIntValue(await _database!.rawQuery("SELECT COUNT(*) FROM sqlite_master WHERE type='table'"))!.toInt();
    }
    if (tableCount == 0) {
      _database = await _initDB('assets/healthCord.db');
    }
    
    totalNoOfPatients = "${(await _database!.rawQuery("SELECT COUNT(Patient_ID) FROM PATIENT;"))[0]['COUNT(Patient_ID)']}";
    noOfMalePatients = "${(await _database!.rawQuery("SELECT COUNT(Patient_ID) FROM PATIENT WHERE Gender = 'Male';"))[0]['COUNT(Patient_ID)']}";
    noOfFemalePatients = "${(await _database!.rawQuery("SELECT COUNT(Patient_ID) FROM PATIENT WHERE Gender = 'Female';"))[0]['COUNT(Patient_ID)']}";
    
    totalAppointments = "${(await _database!.rawQuery("SELECT COUNT(Appointment_ID) FROM APPOINTMENT;"))[0]['COUNT(Appointment_ID)']}";
    totalPrescriptions = "${(await _database!.rawQuery("SELECT COUNT(Presc_ID) FROM PRESCRIPTION;"))[0]['COUNT(Presc_ID)']}";

    completedAppointments = "${(await _database!.rawQuery("SELECT COUNT(Appointment_ID) FROM APPOINTMENT WHERE Status = 'Completed';"))[0]['COUNT(Appointment_ID)']}";
    cancelledAppointments = "${(await _database!.rawQuery("SELECT COUNT(Appointment_ID) FROM APPOINTMENT WHERE Status = 'Cancelled';"))[0]['COUNT(Appointment_ID)']}";
    pendingAppointments = "${(await _database!.rawQuery("SELECT COUNT(Appointment_ID) FROM APPOINTMENT WHERE Status = 'Scheduled';"))[0]['COUNT(Appointment_ID)']}";

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
  Database db = await openDatabase(filePath);
  
  bool? isInitialized = html.window.localStorage['isInitialized'] == 'true';
  if (!isInitialized) {
    db = await initializePatients(db);
    db = await initializeDoctors(db);
    db = await initializeAppointments(db);
    db = await initializePrescription(db);
    db = await initializeRelationship(db);
    html.window.localStorage['isInitialized'] = 'true';
  }
  return db;
}


  Future<List<dynamic>> getPatients() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.rawQuery("SELECT * FROM PATIENT");
    List<dynamic> rows = [];
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
    return rows;
  }

  Future<List<dynamic>> getAppointments() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.rawQuery("SELECT * FROM APPOINTMENT");
    List<dynamic> rows = [];
    for (Map<String, dynamic> appointment in results){
      rows.add(
        [
        appointment['Appointment_ID'],
        appointment['Appointment_Date'],
        appointment['Doctor_ID'],
        appointment['Patient_ID'],
        appointment['Remarks'],
        appointment['Status'],
      ]
      );
    }
    return rows;
  }

  Future<List<dynamic>> getPrescriptions() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.rawQuery("SELECT * FROM PRESCRIPTION");
    List<dynamic> rows = [];
    for (Map<String, dynamic> prescription in results){
      rows.add(
        [
        prescription['Presc_ID'],
        prescription['Doctor_ID'],
        prescription['Patient_ID'],
        prescription['Appointment_ID'],
        prescription['Medication'],
        prescription['Dosage'],
        prescription['Frequency']
      ]
      );
    }
    return rows;
  }

  Future<List<dynamic>> getDoctors() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.rawQuery("SELECT * FROM DOCTOR");
    List<dynamic> rows = [];
    for (Map<String, dynamic> patient in results){
      print(patient);
      rows.add(
        [
        patient['Doctor_ID'],
        patient['First_Name'],
        patient['Last_Name'],
        patient['Email'],
        patient['Phone'],
        patient['Gender'],
        patient['Specialization']
      ]
      );
    }
    return rows;
  }
}
