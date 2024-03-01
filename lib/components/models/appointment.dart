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
    INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-01', 1, 1, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-02', 2, 2, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-03', 1, 3, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-04', 4, 4, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-05', 5, 5, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-06', 2, 6, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-07', 3, 7, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-08', 4, 8, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-09', 5, 9, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-10', 1, 10, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-11', 1, 11, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-12', 2, 12, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-13', 1, 13, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-14', 4, 14, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-15', 5, 15, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-16', 2, 16, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-17', 3, 17, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-18', 4, 18, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-19', 5, 19, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-20', 1, 20, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-21', 1, 21, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-22', 2, 22, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-23', 1, 23, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-24', 4, 24, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-25', 5, 25, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-26', 2, 26, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-27', 3, 27, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-28', 4, 28, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-29', 5, 29, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-30', 1, 30, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-03-31', 1, 31, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-01', 2, 32, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-02', 1, 33, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-03', 4, 34, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-04', 5, 35, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-05', 2, 36, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-06', 3, 37, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-07', 4, 38, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-08', 5, 39, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-09', 1, 40, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-10', 1, 41, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-11', 2, 42, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-12', 1, 43, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-13', 4, 44, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-14', 5, 45, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-15', 2, 46, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-16', 3, 47, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-17', 4, 48, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-18', 5, 49, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-19', 1, 50, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-20', 1, 51, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-21', 2, 52, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-22', 1, 53, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-23', 4, 54, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-24', 5, 55, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-25', 2, 56, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-26', 3, 57, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-27', 4, 58, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-28', 5, 59, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-29', 1, 60, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-04-30', 1, 61, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-01', 2, 62, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-02', 1, 63, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-03', 4, 64, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-04', 5, 65, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-05', 2, 66, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-06', 3, 67, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-07', 4, 68, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-08', 5, 69, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-09', 1, 70, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-10', 1, 71, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-11', 2, 72, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-12', 1, 73, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-13', 4, 74, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-14', 5, 75, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-15', 2, 76, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-16', 3, 77, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-17', 4, 78, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-18', 5, 79, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-19', 1, 80, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-20', 1, 1, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-21', 2, 2, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-22', 1, 3, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-23', 4, 4, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-24', 5, 5, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-25', 2, 6, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-26', 3, 7, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-27', 4, 8, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-28', 5, 9, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-29', 1, 0, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-30', 1, 1, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-05-31', 2, 2, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-01', 1, 3, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-02', 4, 4, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-03', 5, 5, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-04', 2, 6, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-05', 3, 7, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-06', 4, 8, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-07', 5, 9, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-08', 1, 20, 'Cardiology follow-up', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-09', 1, 21, 'Follow-up checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-10', 2, 22, 'Orthopedic consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-11', 1, 23, 'Cardiology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-12', 4, 24, 'Dermatology appointment', 'Cancelled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-13', 5, 25, 'Neurology consultation', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-14', 2, 26, 'Orthopedic follow-up', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-15', 3, 27, 'Cardiology checkup', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-16', 4, 28, 'Dermatology consultation', 'Completed');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-17', 5, 29, 'Neurology examination', 'Scheduled');
INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('2024-06-18', 1, 20, 'Cardiology follow-up', 'Scheduled');

  ''');
  return db;
}

Future<void> insertAppointment(Database db, String patientName, String apptDate, String doctorName, String remarks, String status) async{
  List<String> patientFullName = patientName.split(" ");
  List<String> doctorFullName = doctorName.split(" ");

  String patientID = "${(await db.rawQuery("SELECT Patient_ID FROM PATIENT WHERE First_Name LIKE '%${patientFullName[0]}%'  AND Last_Name LIKE '%${patientFullName[1]}%'"))[0]['Patient_ID']}";
  String doctorID = "${(await db.rawQuery("SELECT Doctor_ID FROM DOCTOR WHERE First_Name LIKE '%${doctorFullName[0]}%'  AND Last_Name LIKE '%${doctorFullName[1]}%'"))[0]['Doctor_ID']}";
  await db.execute("INSERT INTO APPOINTMENT(Appointment_Date, Doctor_ID, Patient_ID, Remarks, Status) VALUES ('$apptDate', '$doctorID', '$patientID', '$remarks', '$status');");
  await db.execute("INSERT INTO RELATIONSHIP(Doctor_ID, Patient_ID) VALUES('$doctorID', '$patientID')");
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