import 'dart:io';

import 'Person.dart';
import 'Student.dart';

void main() {
  // print("Hello Test");

  List<dynamic> list = [210, 10, 40, 545, 453, 43];
  // for (int value in list) {
  //   print(value);
  // }

  // list = bubbleSort(list);
  // print(list);

  // int sum = add(100, 200);
  // print(sum);

  // var tempData = {
  //   'phone': "0176545151",
  //   'email': "alamin@gmail.com",
  //   'gender': "Male"
  // };

  // var keyValueData = new Map();
  // keyValueData['name'] = "Al-Amin";
  // keyValueData['roll'] = 100;

  // print(keyValueData);

  // print(keyValueData["name"]);
  // print(keyValueData['roll']);

  // keyValueData.remove('roll');

  // print(keyValueData);

  // keyValueData.addAll(tempData);

  // print(keyValueData);

  // keyValueData.forEach((k, v) => print('${k}: ${v}'));

  // String? value = stdin.readLineSync();
  // int size = int.parse(value!);
  // drawPattern(size);

  Person person = Person("Al-Amin", "Male", 20);
  print(person);
  print(person.name);
  print(person.age);
  print(person.gender);
  person.canDrive();
  person.canEat();
  print("\n\n After one year later: ");

  person.age = 101;
  print(person);
  print(person.name);
  print(person.age);
  print(person.gender);
  person.canDrive();
  person.canEat();

  print("\n\n New Instance: ");
  person = Person("Bahar", "Male", 21);
  print(person);
  print(person.name);
  print(person.age);
  print(person.gender);
  person.canDrive();
  person.canEat();
}

void drawPattern(int size) {
  for (int i = 1; i <= size; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write("$j ");
    }
    print("");
  }
}

int add(int num1, int num2) {
  return num1 + num2;
}

List bubbleSort(List<dynamic> list) {
  int n = list.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        // swap list[j+1] and list[j]
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }

  return list;
}

  // list.sort();
  // print(list[list.length - 2]);
  // print(list);

  // print(list);
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

