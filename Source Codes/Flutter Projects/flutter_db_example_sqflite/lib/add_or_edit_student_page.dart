import 'package:flutter/material.dart';
import 'package:flutter_db_example_sqflite/db/students_database.dart';
import 'package:flutter_db_example_sqflite/model/student.dart';
import 'package:flutter_db_example_sqflite/widget/student_form_widget.dart';

class AddEditStudentPage extends StatefulWidget {
  final Student? student;

  const AddEditStudentPage({
    Key? key,
    this.student,
  }) : super(key: key);
  @override
  _AddEditStudentPageState createState() => _AddEditStudentPageState();
}

class _AddEditStudentPageState extends State<AddEditStudentPage> {
  final _formKey = GlobalKey<FormState>();
  late String name;
  late String roll_number;
  late String registration_number;
  late String phone_number;
  late String email;

  @override
  void initState() {
    super.initState();

    name = widget.student?.name ?? "";
    roll_number = widget.student?.roll_number ?? "";
    registration_number = widget.student?.registration_number ?? "";
    email = widget.student?.email ?? "";
    phone_number = widget.student?.phone_number ?? "";
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: StudentFormWidget(
            roll_number: roll_number,
            name: name,
            phone_number: phone_number,
            email: email,
            registration_number: registration_number,
            onChangedRollNumber: (roll_number) =>
                setState(() => this.roll_number = roll_number as String),
            onChangedName: (name) => setState(() => this.name = name),
            onChangedPhoneNumber: (phone_number) =>
                setState(() => this.phone_number = phone_number),
            onChangedEmail: (email) => this.email = email,
            onChangedRegistrationNumber: (registration_number) =>
                setState(() => this.registration_number = registration_number),
          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = name.isNotEmpty && phone_number.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.black,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateStudent,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateStudent() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.student != null;

      if (isUpdating) {
        await updateStudent();
      } else {
        await addStudent();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateStudent() async {
    final student = widget.student!.copy(
      roll_number: roll_number,
      name: name,
      phone_number: phone_number,
      registration_number: registration_number,
      email: email
    );

    await StudentsDatabase.instance.update(student);
  }

  Future addStudent() async {
    final student = Student(
      name: name,
      roll_number: roll_number,
      phone_number: phone_number,
      email: email,
      registration_number: registration_number,
      created_at: DateTime.now(),
      updated_at: DateTime.now(),
    );

    await StudentsDatabase.instance.create(student);
  }
}
