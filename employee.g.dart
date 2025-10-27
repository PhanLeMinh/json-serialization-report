// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
  name: json['name'] as String,
  age: (json['age'] as num).toInt(),
  email: json['email'] as String,
  address: json['address'] as String,
  gender: json['gender'] as String,
);

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
  'name': instance.name,
  'age': instance.age,
  'email': instance.email,
  'address': instance.address,
  'gender': instance.gender,
};
