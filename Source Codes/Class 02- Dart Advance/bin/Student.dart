import 'Person.dart';

class Student extends Person {

  Student(super.name, super.gender, super.age);

  void printStudentInfo() {
    print("Hello Student");
  }
}
