import 'dart:ffi';

class Bank {
  static String name = "Bangladesh Bank";
  static String address = "Motijheel, Dhaka";
  static String website = "www.bb.com";

  String getBankInfo() {
    return "name is $name, address is: $address";
  }
}
