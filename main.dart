import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'employee.dart';

void main() {
  runApp(const EmployeeApp());
}

class EmployeeApp extends StatelessWidget {
  const EmployeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Employee List Demo",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const EmployeeListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key});

  @override
  State<EmployeeListPage> createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  List<Employee> employees = [];

  @override
  void initState() {
    super.initState();
    loadEmployees();
  }

  Future<void> loadEmployees() async {
    final jsonString = await rootBundle.loadString('lib/assets/employee.json');
    final data = jsonDecode(jsonString);
    final employeeList = (data['employees'] as List)
        .map((e) => Employee.fromJson(e))
        .toList();

    setState(() {
      employees = employeeList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
        centerTitle: true,
      ),
      body: employees.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final e = employees[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          e.gender == "Male" ? Colors.blue : Colors.pinkAccent,
                      child: Icon(
                        e.gender == "Male" ? Icons.male : Icons.female,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(e.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text("${e.email}\n${e.address}"),
                    isThreeLine: true,
                    trailing: Text("${e.age} yrs",
                        style: const TextStyle(fontWeight: FontWeight.w500)),
                  ),
                );
              },
            ),
    );
  }
}
