import 'package:sqflite/sqflite.dart';

Future<Database> initializeDoctors(Database db) async{
  await db.execute('''
  CREATE TABLE IF NOT EXISTS DOCTOR(
    Doctor_ID INTEGER PRIMARY KEY,
    First_Name TEXT,
    Last_Name TEXT,
    Email TEXT,
    Phone TEXT,
    Specialization TEXT
  );
  ''');

  await db.execute(
    "INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Specialization) VALUES ('Ashwin', 'Vinod', 'ashwinv@example.co', '9999911111', 'Cardiology'), ('Mohammed', 'Shanshad', 'mshanshad@example.com', '9999922222', 'Orthopedics'), ('Snehith', 'Shastry', 'shastry@example.com', '9999933333', 'Cardiology'), ('Gagan', 'Deep', 'gagandeep@example.com', '9999944444', 'Dermatologist'), ('Chethan', 'P', 'chethanpp@example.com', '9999955555', 'Neurology');"
  );
  return db;
}

Future <String> getDoctorName(Database db, String doctorID) async{
  return "${(await db.rawQuery("SELECT First_Name FROM DOCTOR WHERE Doctor_ID = $doctorID;"))[0]['First_Name']} ${(await db.rawQuery("SELECT Last_Name FROM DOCTOR WHERE Doctor_ID = $doctorID;"))[0]['Last_Name']}";
}

Future<String> getDoctorID(Database db, String doctorFullName) async {
  return "${(await db.rawQuery("SELECT Doctor_ID FROM DOCTOR WHERE First_Name LIKE '%${doctorFullName[0]}%'  OR Last_Name LIKE '%${doctorFullName[1]}%'"))[0]['Doctor_ID']}";
}