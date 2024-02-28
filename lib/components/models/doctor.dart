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
    Specialization TEXT,
    Password TEXT
  );
  ''');

  await db.execute(
  '''
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization, Password)  VALUES ('Ashwin', 'Vinod', 'ashwinv@example.co', '9999911111', 'Male','Cardiology', 'password');
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization, Password) VALUES ('Mohammed', 'Shanshad', 'mshanshad@example.com', '9999922222', 'Male','Orthopedics', 'password');
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization, Password)  VALUES ('Snehith', 'Shastry', 'shastry@example.com', '9999933333', 'Male','Cardiology', 'password');
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization, Password) VALUES ('Gagan', 'Deep', 'gagandeep@example.com', '9999944444','Male', 'Dermatologist', 'password');
  INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization, Password) VALUES ('Chethan', 'P', 'chethanpp@example.com', '9999955555', 'Male','Neurology', 'password');
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

Future <bool> isDoctor(Database db,String username, String password) async{
  return (await db.rawQuery("SELECT First_Name FROM DOCTOR WHERE Email = '$username'")).isNotEmpty;
}

Future<String> getDoctorFirstName(Database db, String username) async{
  final results = await (db.rawQuery("SELECT First_Name FROM DOCTOR WHERE Email = '$username'"));
  return (results[0]['First_Name']).toString();
}

Future <void> registerDoctor(Database db, String? firstName, lastName, gender, email, phone, specialization, password) async{
  await db.execute("INSERT INTO DOCTOR (First_Name, Last_Name, Email, Phone, Gender, Specialization, Password) VALUES ('$firstName', '$lastName', '$email', '$phone', '$gender', '$specialization', '$password');");
}