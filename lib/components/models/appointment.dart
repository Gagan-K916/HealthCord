import 'package:sqflite/sqflite.dart';

Future<Database> initializeAppointments(Database db) async{
  await db.execute('''
    CREATE TABLE IF NOT EXISTS APPOINTMENT(
      Appointment_ID INTEGER PRIMARY KEY,
      Appointment_Date TEXT,
      Doctor_ID INTEGER,
      Patient_ID INTEGER,
      Remarks TEXT,
      Status TEXT
    );
  ''');

  await db.execute('''
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-15', '1', '1', 'Follow-up checkup', 'Scheduled');
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-16', '2', '2', 'Orthopedic consultation', 'Completed');
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-17', '1', '3', 'Cardiology examination', 'Scheduled');
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-18', '4', '4', 'Dermatology appointment', 'Cancelled');
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-19', '5', '5', 'Neurology consultation', 'Scheduled');
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-20', '2', '6', 'Orthopedic follow-up', 'Completed');
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-21', '3', '7', 'Cardiology checkup', 'Scheduled');
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-22', '4', '8', 'Dermatology consultation', 'Completed');
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-23', '5', '9', 'Neurology examination', 'Scheduled');
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2023-02-24', '1', '10', 'Cardiology follow-up', 'Scheduled');
  ''');
  return db;
}
