import 'package:sqflite/sqflite.dart';

Future<Database> initializeDoctors(Database db) async{
  await db.execute('''
  CREATE TABLE IF NOT EXISTS DOCTOR(
    Doctor_ID INTEGER PRIMARY KEY,
    First_Name TEXT,
    Last_Name TEXT,
    Email TEXT,
    Phone TEXT,
    Gender TEXT,
    Specialization TEXT
  );
  ''');

  await db.execute(
  '''
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization)  VALUES ('Ashwin', 'Vinod', 'ashwinv@example.co', '9999911111', 'Male','Cardiology');
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization) VALUES ('Mohammed', 'Shanshad', 'mshanshad@example.com', '9999922222', 'Male','Orthopedics');
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization)  VALUES ('Snehith', 'Shastry', 'shastry@example.com', '9999933333', 'Male','Cardiology');
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization) VALUES ('Gagan', 'Deep', 'gagandeep@example.com', '9999944444','Male', 'Dermatologist');
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization) VALUES ('Chethan', 'P', 'chethanpp@example.com', '9999955555', 'Male','Neurology');
'''
  );
  return db;
}

Future <void> insertDoctor(Database db, String? firstName, lastName, gender, email, phone,  specialization) async{
  await db.execute("INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Specialization, Gender) VALUES ('$firstName', '$lastName', '$email', '$phone', '$specialization', '$gender');");
}

Future <String> getDoctorName(Database db, String doctorID) async{
  return "${(await db.rawQuery("SELECT First_Name FROM DOCTOR WHERE Doctor_ID = $doctorID;"))[0]['First_Name']} ${(await db.rawQuery("SELECT Last_Name FROM DOCTOR WHERE Doctor_ID = $doctorID;"))[0]['Last_Name']}";
}

Future<String> getDoctorID(Database db, String doctorFullName) async {
  return "${(await db.rawQuery("SELECT Doctor_ID FROM DOCTOR WHERE First_Name LIKE '${doctorFullName[0]}%'  OR Last_Name LIKE '${doctorFullName[1]}%'"))[0]['Doctor_ID']}";
}

Future <List<Map<String, dynamic>>> getFilteredDoctors(Database db, String searchKey) async{
  return await db.rawQuery('''
    SELECT * 
    FROM DOCTOR
    WHERE First_Name LIKE '$searchKey%'

    UNION

    SELECT *
    FROM DOCTOR  
    WHERE Last_Name LIKE '$searchKey%'

    UNION 

    SELECT * 
    FROM DOCTOR
    WHERE Email LIKE '%$searchKey%'

    UNION

    SELECT *
    FROM DOCTOR
    WHERE Phone LIKE '%$searchKey%'

    UNION

    SELECT *
    FROM DOCTOR
    WHERE Specialization LIKE '%$searchKey%';
    '''
  );
}