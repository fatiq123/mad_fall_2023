import 'dart:convert';

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age};
  }

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['name'] as String, json['age'] as int);
  }
}

void main() {
  var jsonString = '{"name": "John Doe", "age": 25}';
  var jsonMap = jsonDecode(jsonString);
  print(jsonMap);
  var person = Person.fromJson(jsonMap);
  print(person);
  print(person.name); // Output: John Doe
  print(person.age); // Output: 25
}
