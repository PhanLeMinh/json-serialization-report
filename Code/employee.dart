import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  final String name;
  final int age;
  final String email;
  final String address;
  final String gender;

  Employee({
    required this.name,
    required this.age,
    required this.email,
    required this.address,
    required this.gender,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);  
}
