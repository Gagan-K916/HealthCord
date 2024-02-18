import 'package:sqflite/sqflite.dart';

Future <Database> initializePatients(Database db) async{
  await db.execute('''
    CREATE TABLE IF NOT EXISTS PATIENT(
      Patient_ID INTEGER PRIMARY KEY,
      First_Name TEXT,
      Last_Name TEXT,
      Email TEXT,
      Phone TEXT,
      DOB TEXT,
      Gender TEXT
    );
  ''');

  await db.execute(
    "INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ( 'John', 'Doe', 'john.doe@example.com', '1112223333', '1990-05-15', 'Male'), ( 'Jane', 'Smith', 'jane.smith@example.com', '4445556666', '1985-08-20', 'Female'), ( 'Alice', 'Johnson', 'alice.johnson@example.com', '7778889999', '1992-02-10', 'Female'), ( 'Bob', 'Williams', 'bob.williams@example.com', '5556667777', '1988-11-25', 'Male'), ( 'Eva', 'Miller', 'eva.miller@example.com', '3334445555', '1995-07-05', 'Female'), ( 'Michael', 'Brown', 'michael.brown@example.com', '6667778888', '1980-04-30', 'Male'), ( 'Sophia', 'Davis', 'sophia.davis@example.com', '9990001111', '1998-09-15', 'Female'), ( 'David', 'Garcia', 'david.garcia@example.com', '1112223333', '1987-06-20', 'Male'), ( 'Olivia', 'Taylor', 'olivia.taylor@example.com', '2223334444', '1993-12-10', 'Female'), ('Ryan', 'Thomas', 'ryan.thomas@example.com', '8889990000', '1983-03-25', 'Male');"
    );
  return db;
}

Future <void> insertPatient(Database db, String? firstName, lastName, gender, email, phone, dob) async{
  await db.execute("INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('$firstName', '$lastName', '$email', '$phone', '$dob', '$gender');");
}

Future <List<Map<String, dynamic>>> getFilteredPatients(Database db, String searchKey) async{
  return await db.rawQuery('''
    SELECT * 
    FROM PATIENT
    WHERE First_Name LIKE '%$searchKey%'

    UNION

    SELECT *
    FROM PATIENT  
    WHERE Last_Name LIKE '%$searchKey%'

    UNION 

    SELECT * 
    FROM PATIENT
    WHERE Email LIKE '%$searchKey%'

    UNION

    SELECT *
    FROM PATIENT
    WHERE Phone LIKE '%$searchKey%';
    '''
  );
}