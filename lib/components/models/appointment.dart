import 'patient.dart';
import 'doctor.dart';
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

Future<void> insertAppointment(Database db, String patientName, String apptDate, String doctorName, String remarks, String status) async{
  List<String> patientFullName = patientName.split(" ");
  List<String> doctorFullName = doctorName.split(" ");

  String patientID = "${(await db.rawQuery("SELECT Patient_ID FROM PATIENT WHERE First_Name LIKE '%${patientFullName[0]}%'  AND Last_Name LIKE '%${patientFullName[1]}%'"))[0]['Patient_ID']}";
  String doctorID = "${(await db.rawQuery("SELECT Doctor_ID FROM DOCTOR WHERE First_Name LIKE '%${doctorFullName[0]}%'  AND Last_Name LIKE '%${doctorFullName[1]}%'"))[0]['Doctor_ID']}";
  await db.execute("INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('$apptDate', '$doctorID', '$patientID', '$remarks', '$status');");
}

Future <List<Map<String, dynamic>>> getFilteredAppointments(Database db, String filterType, String searchKey) async{
  if(filterType == "Patient"){
  return await db.rawQuery('''
      SELECT * 
      FROM APPOINTMENT
      WHERE Patient_ID LIKE '%${await getPatientID(db, searchKey)}%';
    '''
  );
  }
  else if(filterType == "Doctor"){
    return await db.rawQuery('''
      SELECT *
      FROM APPOINTMENT  
      WHERE Doctor_ID LIKE '%${await getDoctorID(db, searchKey)}%';
      ''');
  }
  else if(filterType == "Status"){
    return await db.rawQuery('''
      SELECT *
      FROM APPOINTMENT  
      WHERE Status LIKE '%$searchKey%';
      ''');
  }else{
    return await db.rawQuery("SELECT * FROM APPOINTMENT");
  }
}