import 'package:flutter/material.dart';
import 'package:flutter_db_example_sqflite/add_or_edit_student_page.dart';
import 'package:flutter_db_example_sqflite/db/students_database.dart';
import 'package:flutter_db_example_sqflite/model/student.dart';
import 'package:flutter_db_example_sqflite/student_detail_page.dart';
import 'package:flutter_db_example_sqflite/widget/student_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StudentListPage extends StatefulWidget {
  @override
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  late List<Student> studentList;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    reloadStudentList();
  }

  @override
  void dispose() {
    StudentsDatabase.instance.close();

    super.dispose();
  }

  Future reloadStudentList() async {
    setState(() => isLoading = true);
    this.studentList = await StudentsDatabase.instance.getAllStudent();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        'Student List',
        style: TextStyle(fontSize: 24),
      ),
      actions: [Icon(Icons.search), SizedBox(width: 12)],
    ),
    body: Center(
      child: isLoading ? CircularProgressIndicator() : studentList.isEmpty ? Text(
        'No Students Found',
        style: TextStyle(color: Colors.black, fontSize: 24),
      )
          : buildStudentList(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.black,
      child: Icon(Icons.add),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => AddEditStudentPage()),
        );

        reloadStudentList();
      },
    ),
  );

  Widget buildStudentList() => StaggeredGridView.countBuilder(
    padding: EdgeInsets.all(8),
    itemCount: studentList.length,
    staggeredTileBuilder: (index) => StaggeredTile.fit(2),
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final student = studentList[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => StudentDetailsPage(studentId: student.id!),
          ));

          reloadStudentList();
        },
        child: StudentCardWidget(student: student, index: index),
      );
    },
  );
}
