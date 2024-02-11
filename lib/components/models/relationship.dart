import 'package:sqflite/sqflite.dart';

Future<Database> initializeRelationship(Database db) async{
  await db.execute('''
    CREATE TABLE IF NOT EXISTS RELATIONSHIP(
      Doctor ID INTEGER,
      Patient_ID INTEGER
    );
  ''');

  await db.execute(
    "INSERT INTO RELATIONSHIP VALUES (1, 1), (2, 2), (1, 3), (4, 4), (5, 5), (2, 6), (3, 7), (4, 8), (5, 9), (1, 10), (3, 8);"
  );
  return db;
}