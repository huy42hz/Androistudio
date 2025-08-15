import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefDemo extends StatefulWidget {
  @override
  _SharedPrefDemoState createState() => _SharedPrefDemoState();
}

class _SharedPrefDemoState extends State<SharedPrefDemo> {
  String? savedName;

  Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', name);
  }

  Future<void> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedName = prefs.getString('username') ?? 'Chưa lưu';
    });
  }

  @override
  void initState() {
    super.initState();
    loadName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SharedPreferences Demo")),
      body: Column(
        children: [
          Text("Tên đã lưu: $savedName"),
          TextField(
            onSubmitted: (value) {
              saveName(value);
              loadName();
            },
            decoration: InputDecoration(labelText: "Nhập tên"),
          ),
        ],
      ),
    );
  }
}
