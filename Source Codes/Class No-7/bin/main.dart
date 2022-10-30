import 'dart:collection';
import 'dart:io';

import 'Button.dart';
import 'Days.dart';
import 'LoginActivity.dart';

void main() {
  print("Switch case");

  // String? name = stdin.readLineSync();
  // print("Input name is " + name!);

  // var mark = 100;
  // if (mark <= 32) {
  //   print("Grade - F");
  // } else if (mark >= 33 && mark <= 50) {
  //   print("Grade - B");
  // } else if (mark >= 50 && mark <= 70) {
  //   print("Grade - A");
  // } else if (mark >= 80 && mark <= 100) {
  //   print("Grade - A+");
  // }

  // var switchNumber = 5;
  // switch (switchNumber) {
  //   case 1:
  //     {
  //       print("Turn on light 1");
  //     }
  //     break;
  //   case 2:
  //     {
  //       print("Turn on light 2");
  //     }
  //     break;

  //   case 3:
  //     {
  //       print("Turn on light 3");
  //     }
  //     break;

  //   case 4:
  //     {
  //       print("Turn on light 4");
  //     }
  //     break;

  //   case 5:
  //     {
  //       print("Turn on light 5");
  //     }
  //     break;
  //   default:
  //     {
  //       print("Default block");
  //     }
  //     break;
  // }

  // example of labels
  // Loop1:
  // for (int i = 1; i < 11; i++) {
  //   print("Loop1 i ================ " + i.toString());

  //   if (i == 5) {
  //     continue;
  //   }
  //   Loop2:
  //   for (int j = 1; j < 11; j++) {
  //     if (j == 5) {
  //       continue Loop1;
  //     }

  //     print("Loop2 j = " + j.toString());
  //   }
  // }

  // Dart doesn't support Overloading

// try-catch-finally / exception handling example
  // var money = "Five hundred";
  // try {
  //   print(int.parse(money) / 5);
  // } catch (exception) {
  //   print(exception.toString());
  // } finally {
  //   print("finally block");
  // }

  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");
  // print("test print");

  // Queues example
  // Creating a Queue
  // Queue<String> queues = new Queue<String>();

  // // Printing default
  // // value of queue
  // print(queues);

  // // Adding elements in a Queue
  // queues.add("Bahar");
  // queues.add("Kahar");
  // queues.add("Tahar");
  // queues.add("Mahar");

  // // Printing the
  // // inserted elements
  // print(queues);

  // queues.addFirst("Al-Amin");
  // print(queues);

  // Creating a List
  // List<String> geek_list = ["Geeks","For","Geeks"];
  // // Creating a Queue through a List
  // Queue<String> geek_queue = new Queue<String>.from(geek_list);

  // // Printing the elements
  // // in the queue
  // print(geek_queue);

// exmaple of enum
  // print("Enum day is: " + (Days.values).toString().replaceAll("Days.", ""));


  // Example of interface
  // Button button = Button();
  // button.onClick();
  //
  // button.onLongClick();

  // example of abstract class
  LoginActivity loginActivity = LoginActivity();
  loginActivity.onCreate(100);

}

void printSomething(String str) {
  print("value is: " + str);
}
