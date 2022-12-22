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
        ${StudentTable.updated_at} $textType
      )
    ''');
  }

  Future<Student> create(Student student) async {
    final db = await instance.database;
    final id = await db.insert(studentTable, student.toJson());
    return student.copy(id: id);
  }

  Future<Student> getStudentById(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      studentTable,
      columns: StudentTable.values,
      where: '${StudentTable.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Student.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<Student> searchStudent(String searchText) async {
    final db = await instance.database;

    // final maps = await db.query(
    //   studentTable,
    //   columns: StudentTable.values,
    //   where: '${StudentTable.id} = ?',
    //   whereArgs: [id],
    // );

    /*await db.query('my_table',
        where: "name LIKE ? and roll_number = ? and email = ?",
        whereArgs: ['$searchText%', searchText, searchText],
        orderBy: 'id',
        limit: 10);*/

    final searchResultMap = await db.rawQuery('select * from ${studentTable} where _id like ${searchText} or name like ${searchText}');

    if (searchResultMap.isNotEmpty) {
      return Student.fromJson(searchResultMap.first);
    } else {
      throw Exception('Search result not found');
    }
  }

  Future<List<Student>> getAllStudent() async {
    final db = await instance.database;
    final result = await db.query(studentTable);
    return result.map((e) => Student.fromJson(e)).toList();
  }

  Future<int> update(Student student) async {
    final db = await instance.database;
    return db.update(studentTable, student.toJson(), where: '${StudentTable.id} = ?', whereArgs: [student.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    // return await db.delete(studentTable); // to delete all the data from db.
    return await db.delete(studentTable, where: '${StudentTable.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }


}