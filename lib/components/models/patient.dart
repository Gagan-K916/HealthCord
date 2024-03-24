import 'package:healthcord/components/patients.dart';
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
    '''
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('John', 'Doe', 'john.doe@example.com', '1112223333', '1990-05-15', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Jane', 'Smith', 'jane.smith@example.com', '4445556666', '1985-08-20', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Alice', 'Johnson', 'alice.johnson@example.com', '7778889999', '1992-02-10', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Bob', 'Williams', 'bob.williams@example.com', '5556667777', '1988-11-25', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Eva', 'Miller', 'eva.miller@example.com', '3334445555', '1995-07-05', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Michael', 'Brown', 'michael.brown@example.com', '6667778888', '1980-04-30', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Sophia', 'Davis', 'sophia.davis@example.com', '9990001111', '1998-09-15', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('David', 'Garcia', 'david.garcia@example.com', '1112223333', '1987-06-20', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Olivia', 'Taylor', 'olivia.taylor@example.com', '2223334444', '1993-12-10', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Ryan', 'Thomas', 'ryan.thomas@example.com', '8889990000', '1983-03-25', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Christopher', 'Wilson', 'christopher.wilson@example.com', '1234567890', '1991-07-12', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Jessica', 'Martinez', 'jessica.martinez@example.com', '2345678901', '1986-09-18', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Matthew', 'Anderson', 'matthew.anderson@example.com', '3456789012', '1994-02-22', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Amanda', 'Hernandez', 'amanda.hernandez@example.com', '4567890123', '1989-11-28', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Joshua', 'Gonzalez', 'joshua.gonzalez@example.com', '5678901234', '1996-06-05', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Sarah', 'Lopez', 'sarah.lopez@example.com', '6789012345', '1984-04-15', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Andrew', 'Perez', 'andrew.perez@example.com', '7890123456', '1990-10-30', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Samantha', 'Taylor', 'samantha.taylor@example.com', '8901234567', '1987-03-08', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Daniel', 'Robinson', 'daniel.robinson@example.com', '9012345678', '1995-12-14', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Emily', 'Harris', 'emily.harris@example.com', '0123456789', '1982-08-20', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Christopher', 'Lee', 'christopher.lee@example.com', '3210987654', '1988-01-25', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Ashley', 'Clark', 'ashley.clark@example.com', '4321098765', '1993-07-01', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Brandon', 'Lewis', 'brandon.lewis@example.com', '5432109876', '1981-05-10', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Megan', 'Walker', 'megan.walker@example.com', '6543210987', '1998-11-20', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Justin', 'Young', 'justin.young@example.com', '7654321098', '1986-09-05', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Lauren', 'Green', 'lauren.green@example.com', '8765432109', '1991-02-15', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Tyler', 'Hill', 'tyler.hill@example.com', '9876543210', '1984-12-03', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Kayla', 'Adams', 'kayla.adams@example.com', '0987654321', '1997-06-17', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Alexander', 'Baker', 'alexander.baker@example.com', '9012345678', '1989-10-22', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Rachel', 'Nelson', 'rachel.nelson@example.com', '9876543210', '1994-03-28', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Nathan', 'Carter', 'nathan.carter@example.com', '1234567890', '1983-08-14', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Hannah', 'Wright', 'hannah.wright@example.com', '2345678901', '1996-01-10', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Michael', 'Evans', 'michael.evans@example.com', '3456789012', '1980-05-24', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Kaylee', 'King', 'kaylee.king@example.com', '4567890123', '1993-10-05', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Joseph', 'Ward', 'joseph.ward@example.com', '5678901234', '1987-07-21', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Madison', 'Rivera', 'madison.rivera@example.com', '6789012345', '1992-12-15', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Ethan', 'Torres', 'ethan.torres@example.com', '7890123456', '1981-02-08', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Emma', 'Collins', 'emma.collins@example.com', '8901234567', '1990-09-03', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('James', 'Gomez', 'james.gomez@example.com', '9012345678', '1985-04-18', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Olivia', 'Mitchell', 'olivia.mitchell@example.com', '0123456789', '1998-11-22', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Andrew', 'Perez', 'andrew.perez@example.com', '1234567890', '1983-06-05', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Sophia', 'Flores', 'sophia.flores@example.com', '2345678901', '1996-01-30', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Logan', 'Simmons', 'logan.simmons@example.com', '3456789012', '1989-05-14', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Avery', 'Russell', 'avery.russell@example.com', '4567890123', '1994-12-18', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Benjamin', 'Long', 'benjamin.long@example.com', '5678901234', '1988-09-23', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Chloe', 'Hughes', 'chloe.hughes@example.com', '6789012345', '1993-02-28', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('William', 'Reed', 'william.reed@example.com', '7890123456', '1982-07-13', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Abigail', 'Price', 'abigail.price@example.com', '8901234567', '1997-10-07', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Gabriel', 'Washington', 'gabriel.washington@example.com', '9012345678', '1984-03-17', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Harper', 'Coleman', 'harper.coleman@example.com', '0123456789', '1989-12-21', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Lucas', 'Jenkins', 'lucas.jenkins@example.com', '1234567890', '1995-07-26', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Elizabeth', 'Hayes', 'elizabeth.hayes@example.com', '2345678901', '1980-10-04', 'Female');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Jackson', 'Perry', 'jackson.perry@example.com', '3456789012', '1992-05-09', 'Male');
    INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('Alyssa', 'Powell', 'alyssa.powell@example.com', '4567890123', '1986-08-16', 'Female');

    ''');
  return db;
}

Future <void> insertPatient(Database db, String? firstName, lastName, gender, email, phone, dob) async{
  await db.execute("INSERT INTO PATIENT (First_Name, Last_Name, Email, Phone, DOB, Gender) VALUES ('$firstName', '$lastName', '$email', '$phone', '$dob', '$gender');");
}

Future <List<Map<String, dynamic>>> getFilteredPatients(Database db, String searchKey, String username) async{
  return username == "Admin"? 
  await db.rawQuery('''
    SELECT * 
    FROM PATIENT
    WHERE First_Name LIKE '$searchKey%'

    UNION

    SELECT *
    FROM PATIENT  
    WHERE Last_Name LIKE '$searchKey%'

    UNION 

    SELECT * 
    FROM PATIENT
    WHERE Email LIKE '%$searchKey%'

    UNION

    SELECT *
    FROM PATIENT
    WHERE Phone LIKE '%$searchKey%'; 
    '''):
  await db.rawQuery('''
    SELECT * 
    FROM PATIENT
    WHERE First_Name LIKE '$searchKey%' AND Patient_ID IN (SELECT Patient_ID FROM RELATIONSHIP WHERE Doctor_ID IN (SELECT Doctor_ID FROM DOCTOR WHERE First_Name LIKE '$username%'))

    UNION

    SELECT *
    FROM PATIENT  
    WHERE Last_Name LIKE '$searchKey%' AND Patient_ID IN (SELECT Patient_ID FROM RELATIONSHIP WHERE Doctor_ID IN (SELECT Doctor_ID FROM DOCTOR WHERE First_Name LIKE '$username%'))

    UNION 

    SELECT * 
    FROM PATIENT
    WHERE Email LIKE '%$searchKey%' AND Patient_ID IN (SELECT Patient_ID FROM RELATIONSHIP WHERE Doctor_ID IN (SELECT Doctor_ID FROM DOCTOR WHERE First_Name LIKE '$username%'))

    UNION

    SELECT *
    FROM PATIENT
    WHERE Phone LIKE '%$searchKey%' AND Patient_ID IN (SELECT Patient_ID FROM RELATIONSHIP WHERE Doctor_ID IN (SELECT Doctor_ID FROM DOCTOR WHERE First_Name LIKE '$username%')); 
    '''
  );
}

Future <String> getPatientName(Database db, String patientID) async{
  return "${(await db.rawQuery("SELECT First_Name FROM PATIENT WHERE Patient_ID = $patientID;"))[0]['First_Name']} ${(await db.rawQuery("SELECT Last_Name FROM PATIENT WHERE Patient_ID = $patientID;"))[0]['Last_Name']}";
}

Future<String> getPatientID(Database db, String patientFullName) async {
  return "${(await db.rawQuery("SELECT Patient_ID FROM PATIENT WHERE First_Name LIKE '${patientFullName[0]}%'  Or Last_Name LIKE '${patientFullName[1]}%'"))[0]['Patient_ID']}";
}

