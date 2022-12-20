final String studentTable = 'students';

class StudentTable {

  static final List<String> values = [
    // tables fields
    id, name, roll_number, registration_number, phone_number, email, created_at, updated_at
  ];

  static final String id = "_id";
  static final String name = "name";
  static final String roll_number = "roll_number";
  static final String registration_number = "registration_number";
  static final String phone_number = "phone_number";
  static final String email = "email";
  static final String created_at = "created_at";
  static final String updated_at = "updated_at";
}


class Student{
  final int? id;
  final String name;
  final String roll_number;
  final String registration_number;
  final String phone_number;
  final String email;
  final String created_at;
  final String updated_at;

  const Student({
    this.id,
    required this.name,
    required this.roll_number,
    required this.registration_number,
    required this.phone_number,
    required this.email,
    required this.created_at,
    required this.updated_at});

  Student copy({
    int? id,
    String? name,
    String? roll_number,
    String? registration_number,
    String? phone_number,
    String? email,
    String? created_at,
    String? updated_at,
  }) => Student(id: id?? this.id, name: name ?? this.name, roll_number: roll_number?? this.roll_number, registration_number: registration_number?? this.registration_number, phone_number: phone_number?? this.phone_number, email: email?? this.email, created_at: created_at?? this.created_at, updated_at: updated_at?? this.updated_at);


  static Student fromJson(Map<String, Object?> json) => Student(id: json[StudentTable.id] as int?,
    name: json[StudentTable.name] as String,
    roll_number: json[StudentTable.roll_number] as String,
    registration_number: json[StudentTable.registration_number] as String,
    phone_number: json[StudentTable.phone_number] as String,
    email: json[StudentTable.email] as String,
    created_at: json[StudentTable.created_at] as String,
    updated_at: json[StudentTable.updated_at] as String,
  );

  Map<String, Object?> toJson() => {
    StudentTable.id: id,
    StudentTable.name: name,
    StudentTable.roll_number: roll_number,
    StudentTable.registration_number: registration_number,
    StudentTable.phone_number: phone_number,
    StudentTable.email: email,
    StudentTable.created_at: created_at,
    StudentTable.updated_at: updated_at,
  };

}