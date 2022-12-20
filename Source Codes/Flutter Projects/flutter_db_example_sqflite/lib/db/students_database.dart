import 'package:flutter_db_example_sqflite/model/student.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class StudentsDatabase{

  // instance of the db
  static final StudentsDatabase instance = StudentsDatabase._init();

  // getting database class object in this variable.
  static Database? databaseObj;

  StudentsDatabase._init();

  Future<Database> get database async {
    if(databaseObj != null) return databaseObj!;

    databaseObj = await _initDB('students_db');
    return databaseObj!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath(); // getting the db file path.
    final path = join(dbPath, dbName); // concatenating the db file path

    return await openDatabase(path, version: 1, onCreate: _onCreateDatabase);
  }

  Future _onCreateDatabase (Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final booleanType = 'BOOLEAN NOT NULL';
    final intType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $studentTable (
        ${StudentTable.id} $idType,
        ${StudentTable.name} $textType,
        ${StudentTable.roll_number} $textType,
        ${StudentTable.registration_number} $textType,
        ${StudentTable.phone_number} $textType,
        ${StudentTable.email} $textType,
        ${StudentTable.created_at} $textType,
        ${StudentTable.updated_at} $textType,
      )
    ''');
  }

  Future<Student> create(Student student) async {
    final db = await instance.database;


    final id = await db.insert(studentTable, student.toJson());
    return student.copy(id: id);
  }



}