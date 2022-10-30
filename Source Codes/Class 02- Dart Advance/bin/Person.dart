class Person {
  String name = "";
  String gender = "";
  int age = 0;

  Person(String name, String gender, int age) {
    this.name = name;
    this.gender = gender;
    this.age = age;
  }

  void setName(String name) {
    this.name = name;
  }

  String getName() {
    return this.name;
  }

  void canDrive() {
    print("Can Drive Bike");
  }

  void canEat() {
    print("Can Eat");
  }
}
