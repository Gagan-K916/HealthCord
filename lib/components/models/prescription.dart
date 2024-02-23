import 'package:sqflite/sqflite.dart';
import 'doctor.dart';
import 'patient.dart';

Future<Database> initializePrescription(Database db) async{
  await db.execute('''
  CREATE TABLE IF NOT EXISTS PRESCRIPTION(
    Presc_ID INTEGER PRIMARY KEY,
    Doctor_ID INTEGER,
    Patient_ID INTEGER,
    Appointment_ID INTEGER,
    Medication TEXT,
    Dosage TEXT,
    Frequency TEXT
  );
  ''');

  await db.execute(
    '''
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 1, 1, 'Aspirin', '10mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 2, 2, 'Ibuprofen', '200mg', 'Twice daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 3, 3, 'Metoprolol', '50mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 4, 4, 'Cetirizine', '10mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 5, 5, 'Gabapentin', '300mg', 'Three timesdaily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 6, 6, 'Ibuprofen', '200mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 7, 7, 'Aspirin', '10mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 8, 8, 'Hydrocortisone', '1%', 'Apply a needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 9, 9, 'Topiramate', '50mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 10, 10, 'Aspirin', '10mg', 'Once daily');
'''
  );
  return db;
}

Future<void> insertPrescription(Database db, String apptID, String patientName, String doctorName, String medication, String dosage, String frequency) async{
  await db.execute("INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES('${await getDoctorID(db, doctorName)}', '${await getPatientID(db, patientName)}', '$apptID', '$medication', '$dosage', '$frequency');");
}

Future <List<Map<String, dynamic>>> getFilteredPrescriptions(Database db, String filterType, String searchKey) async{
  if(filterType == "Patient"){
  return await db.rawQuery('''
      SELECT * 
      FROM PRESCRIPTION
      WHERE Patient_ID LIKE '%${await getPatientID(db, searchKey)}%';
    '''
  );
  }
  else if(filterType == "Doctor"){
    return await db.rawQuery('''
      SELECT *
      FROM PRESCRIPTION  
      WHERE Doctor_ID LIKE '%${await getDoctorID(db, searchKey)}%';
      ''');
  }
  else if(filterType == "Medication"){
    return await db.rawQuery('''
      SELECT *
      FROM PRESCRIPTION  
      WHERE Medication LIKE '%$searchKey%';
      ''');
  }else{
    return await db.rawQuery("SELECT * FROM PRESCRIPTION");
  }
}