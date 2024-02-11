import 'package:healthcord/components/models/appointment.dart';
import 'package:healthcord/components/models/doctor.dart';
import 'package:healthcord/components/models/prescription.dart';
import 'package:healthcord/components/models/relationship.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart' as sqfliteFfi_web;
import 'models/patient.dart';
import 'package:flutter/material.dart';

class PatientDatabase {
  PatientDatabase._init(){
    // Initialize sqflite for web
    databaseFactory = sqfliteFfi_web.databaseFactoryFfiWeb;
  }

  static final PatientDatabase instance = PatientDatabase._init();

  static Database? _database;

  Future<Database> get database async {
    if(_database == null){
    _database = await _initDB('assets/healthCord.db'); 
    }
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {

  Database db = await openDatabase(filePath);
  db = await initializePatients(db);
  db = await initializeDoctors(db);
  db = await initializeAppointments(db);
  db = await initializePrescription(db);
  db = await initializeRelationship(db);
  return db;
}

  Future<List<dynamic>> getPatients() async{
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

  Future<List<dynamic>> getAppointments() async{
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.rawQuery("SELECT * FROM APPOINTMENT");
    List<dynamic> rows = [];
    for (Map<String, dynamic> appointment in results){
      rows.add(
        [
        appointment['Appointment_ID'],
        appointment['Doctor_ID'],
        appointment['Patient_ID'],
        appointment['Remarks'],
        appointment['Status'],
        
      ]
      );
    }
    return rows;
  }

  Future<List<dynamic>> getPrescriptions() async{
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

}