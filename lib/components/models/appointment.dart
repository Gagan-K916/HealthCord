import 'package:sqflite/sqflite.dart';

Future<Database> initializeAppointments(Database db) async{
  await db.execute('''
    CREATE TABLE IF NOT EXISTS APPOINTMENT(
      Appointment_ID INTEGER,
      Doctor_ID INTEGER,
      Patient_ID INTEGER,
      Remarks TEXT,
      Status TEXT
    );
  ''');

  await db.execute(
    "INSERT INTO APPOINTMENT VALUES ('1', '1', '1', 'Follow-up checkup', 'Scheduled'), ('2', '2', '2', 'Orthopedic consultation', 'Completed'), ('3', '1', '3', 'Cardiology examination', 'Scheduled'), ('4', '4', '4', 'Dermatology appointment', 'Cancelled'), ('5', '5', '5', 'Neurology consultation', 'Scheduled'), ('6', '2', '6', 'Orthopedic follow-up', 'Completed'), ('7', '3', '7', 'Cardiology checkup', 'Scheduled'), ('8', '4', '8', 'Dermatology consultation', 'Completed'), ('9', '5', '9', 'Neurology examination', 'Scheduled'), ('10', '1', '10', 'Cardiology follow-up', 'Scheduled');"
  );
  return db;
}