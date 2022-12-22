import 'package:flutter/material.dart';

class StudentFormWidget extends StatelessWidget {
  final String? roll_number;
  final String? name;
  final String? phone_number;
  final String? email;
  final String? registration_number;
  final ValueChanged<String> onChangedRollNumber;
  final ValueChanged<String> onChangedName;
  final ValueChanged<String> onChangedPhoneNumber;
  final ValueChanged<String> onChangedEmail;
  final ValueChanged<String> onChangedRegistrationNumber;

  const StudentFormWidget({
    Key? key,
    this.roll_number = '',
    this.name = '',
    this.phone_number = '',
    this.email = '',
    this.registration_number = '',
    required this.onChangedRollNumber,
    required this.onChangedName,
    required this.onChangedPhoneNumber,
    required this.onChangedEmail,
    required this.onChangedRegistrationNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildRollNumber(),
              buildName(),
              buildPhoneNumber(),
              buildEmail(),
              buildRegistrationNumber(),
            ],
          ),
        ),
      );

  Widget buildName() => TextFormField(
        maxLines: 1,
        initialValue: name,
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Student Name',
          hintStyle: TextStyle(color: Colors.black54),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'The student name cannot be empty' : null,
        onChanged: onChangedName,
      );

  Widget buildPhoneNumber() => TextFormField(
        maxLines: 5,
        initialValue: phone_number,
        style: TextStyle(color: Colors.black54, fontSize: 18),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Type phone number...',
          hintStyle: TextStyle(color: Colors.black54),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'The phone number cannot be empty'
            : null,
        onChanged: onChangedPhoneNumber,
      );

  Widget buildEmail() => TextFormField(
    maxLines: 5,
    initialValue: email,
    style: TextStyle(color: Colors.black54, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Type email...',
      hintStyle: TextStyle(color: Colors.black54),
    ),
    validator: (email) => email != null && email.isEmpty
        ? 'The email cannot be empty'
        : null,
    onChanged: onChangedEmail,
  );

  Widget buildRegistrationNumber() => TextFormField(
    maxLines: 5,
    initialValue: registration_number,
    style: TextStyle(color: Colors.black54, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Type registration number...',
      hintStyle: TextStyle(color: Colors.black54),
    ),
    validator: (registration_number) => registration_number != null && registration_number.isEmpty
        ? 'The registration number cannot be empty'
        : null,
    onChanged: onChangedRegistrationNumber,
  );

  Widget buildRollNumber() => TextFormField(
    maxLines: 5,
    initialValue: roll_number,
    style: TextStyle(color: Colors.black54, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Type roll number...',
      hintStyle: TextStyle(color: Colors.black54),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The roll number cannot be empty'
        : null,
    onChanged: onChangedRollNumber,
  );
}
