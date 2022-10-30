import 'dart:ffi';
import 'Bank.dart';

class BankAccount {
  Bank bank = new Bank();

  String acName = "";
  String acNumber = "";
  double balance = 0.0;
  String address = "";
  String emailId = "";

  BankAccount(String name, String acNumber, String address) {
    this.acName = name;
    this.acNumber = acNumber;
    this.address = address;
  }

  void setAddress(String address) {
    this.address = address;
  }

  void withDrawBalance(double ammount) {
    if (this.balance > ammount) {
      this.balance -= ammount;
      print("Transaction Successful!");
    } else {
      print("Insufficient Balance!");
    }
  }

  void depositeBalance(double ammount) {
    if (ammount > 0) {
      this.balance += ammount;
      print("Deposite Successful!");
    } else {
      print("Ammount not valid!");
    }
  }

  void getAccountInfo() {
    print("A/C Name: $acName, Current Balance: $balance");
  }
}
