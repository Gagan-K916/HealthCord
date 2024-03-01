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
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 11, 11, 'Atorvastatin', '20mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 12, 12, 'Lisinopril', '10mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 13, 13, 'Metformin', '500mg', 'Twice daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 14, 14, 'Loratadine', '10mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 15, 15, 'Sertraline', '50mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 16, 16, 'Omeprazole', '20mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 17, 17, 'Alprazolam', '0.25mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 18, 18, 'Cephalexin', '500mg', 'Four times daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 19, 19, 'Duloxetine', '30mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 20, 20, 'Montelukast', '10mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 21, 21, 'Metoprolol', '50mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 22, 22, 'Warfarin', '5mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 23, 23, 'Simvastatin', '20mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 24, 24, 'Tramadol', '50mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 25, 25, 'Amlodipine', '5mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 26, 26, 'Metronidazole', '250mg', 'Three times daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 27, 27, 'Doxycycline', '100mg', 'Twice daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 28, 28, 'Fluoxetine', '20mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 29, 29, 'Clonazepam', '0.5mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 30, 30, 'Trazodone', '50mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 31, 31, 'Losartan', '50mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 32, 32, 'Zolpidem', '10mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 33, 33, 'Gabapentin', '300mg', 'Three times daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 34, 34, 'Amoxicillin', '500mg', 'Three times daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 35, 35, 'Citalopram', '20mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 36, 36, 'Prednisone', '5mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 37, 37, 'Hydroxyzine', '25mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 38, 38, 'Levothyroxine', '50mcg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 39, 39, 'Oxycodone', '5mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 40, 40, 'Pregabalin', '75mg', 'Twice daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 41, 41, 'Tamsulosin', '0.4mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 42, 42, 'Furosemide', '20mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 43, 43, 'Diazepam', '5mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 44, 44, 'Venlafaxine', '75mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 45, 45, 'Carvedilol', '6.25mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 46, 46, 'Sildenafil', '50mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 47, 47, 'Naproxen', '220mg', 'Twice daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 48, 48, 'Ciprofloxacin', '500mg', 'Twice daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 49, 49, 'Bupropion', '150mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 50, 50, 'Escitalopram', '10mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 51, 51, 'Clonidine', '0.1mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 52, 52, 'Fluticasone', '50mcg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 53, 53, 'Doxepin', '25mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 54, 54, 'Budesonide', '0.5mg', 'Twice daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 55, 55, 'Lorazepam', '1mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 56, 56, 'Celecoxib', '200mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 57, 57, 'Amphetamine', '5mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 58, 58, 'Diphenhydramine', '25mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 59, 59, 'Methylphenidate', '10mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 60, 60, 'Modafinil', '100mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 61, 61, 'Lamotrigine', '25mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 62, 62, 'Meloxicam', '7.5mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 63, 63, 'Paroxetine', '20mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (2, 64, 64, 'Venlafaxine', '150mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 65, 65, 'Desvenlafaxine', '50mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (3, 66, 66, 'Tramadol', '100mg', 'As needed');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 67, 67, 'Doxazosin', '1mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (4, 68, 68, 'Dicyclomine', '10mg', 'Three times daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 69, 69, 'Lisdexamfetamine', '30mg', 'Once daily');
    INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (5, 70, 70, 'Atomoxetine', '40mg', 'Once daily');

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