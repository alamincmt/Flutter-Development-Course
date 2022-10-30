import 'dart:io';

import 'Bank.dart';
import 'BankAccount.dart';
import 'Person.dart';
import 'Student.dart';

void main() {
  // print("Welcome to ${Bank.name}.");

  // BankAccount bankAccount =
  //     new BankAccount("Chandan Krishna", "234234234234", "Mirpur, Dhaka");
  // bankAccount.setAddress("NY, USA");

  // bankAccount.getAccountInfo();
  // bankAccount.depositeBalance(100000000);

  // bankAccount.getAccountInfo();
  // bankAccount.withDrawBalance(999999999);

  // bankAccount.getAccountInfo();
  // print(bankAccount.bank.getBankInfo());

  Student student = new Student("Ali Akbar Rupu", "Male", 25);
  print(student.name);
}

// 1
// 1 2
// 1 2 3
// 1 2 3 4
// 1 2 3 4 5

// 1 1 1 1 1
// 2 2 2 2 2
// 3 3 3 3 3
// 4 4 4 4 4
// 5 5 5 5 5

//         1
//       1 2
//     1 2 3
//   1 2 3 4
// 1 2 3 4 5

