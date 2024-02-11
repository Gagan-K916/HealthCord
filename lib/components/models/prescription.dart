import 'package:sqflite/sqflite.dart';

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
    "INSERT INTO PRESCRIPTION (Doctor_ID, Patient_ID, Appointment_ID, Medication, Dosage, Frequency) VALUES (1, 1, 1, 'Aspirin', '10mg', 'Once daily'), (2, 2, 2, 'Ibuprofen', '200mg', 'Twice daily'), (1, 3, 3, 'Metoprolol', '50mg', 'Once daily'), (4, 4, 4, 'Cetirizine', '10mg', 'Once daily'), (5, 5, 5, 'Gabapentin', '300mg', 'Three times daily'), (2, 6, 6, 'Ibuprofen', '200mg', 'Once daily'), (3, 7, 7, 'Aspirin', '10mg', 'Once daily'), (4, 8, 8, 'Hydrocortisone', '1%', 'Apply as needed'), (5, 9, 9, 'Topiramate', '50mg', 'Once daily'), (1, 10, 10, 'Aspirin', '10mg', 'Once daily');"
  );
  return db;
}