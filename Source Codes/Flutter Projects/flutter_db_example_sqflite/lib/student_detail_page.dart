import 'package:flutter/material.dart';
import 'package:flutter_db_example_sqflite/add_or_edit_student_page.dart';
import 'package:flutter_db_example_sqflite/db/students_database.dart';
import 'package:flutter_db_example_sqflite/model/student.dart';
import 'package:intl/intl.dart';

class StudentDetailsPage extends StatefulWidget {
  final int studentId;

  const StudentDetailsPage({
    Key? key,
    required this.studentId,
  }) : super(key: key);

  @override
  _StudentDetailsPageState createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  late Student student;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    reloadStudentList();
  }

  Future reloadStudentList() async {
    setState(() => isLoading = true);
    this.student = await StudentsDatabase.instance.getStudentById(widget.studentId);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: EdgeInsets.all(12),
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      student.name,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(student.created_at),
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      student.phone_number,
                      style: TextStyle(color: Colors.black54, fontSize: 18),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditStudentPage(student: student),
        ));

        reloadStudentList();
      });

  Widget deleteButton() => IconButton(
        icon: Icon(Icons.delete),
        onPressed: () async {
          await StudentsDatabase.instance.delete(widget.studentId);

          Navigator.of(context).pop();
        },
      );
}
