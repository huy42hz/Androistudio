import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => ToDoAppPage();
}
class ToDoAppPage extends State<ToDoApp> {
  final texts = TextEditingController();
  final List<Map<String, dynamic>> cv = [];

  void themcv() {
    if (texts.text.isNotEmpty) {
      setState(() {
        cv.add({
          'title': texts.text,
          'done': false,
        });
        texts.clear();
      });
    }
  }

  void danhdaucv(int index) {
    setState(() {
      cv[index]['done'] = !cv[index]['done'];
    });
  }

  void xoacv(int index) {
    setState(() {
      cv.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách công việc"),
        backgroundColor: Colors.teal[300],
        centerTitle: true,
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: texts,
                    decoration: const InputDecoration(
                      hintText: "Nhập công việc...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: themcv,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  child: Icon(Icons.add),
                )

              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: cv.length,
              itemBuilder: (context, index) {
                final congViec = cv[index];
                return ListTile(
                  leading: Checkbox(
                    value: congViec['done'],
                    onChanged: (_) => danhdaucv(index),
                  ),
                  title: Text(
                    congViec['title'],
                    style: TextStyle(
                      decoration: congViec['done']
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => xoacv(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
void main() {
  runApp(const MaterialApp(
    home: ToDoApp(),
    debugShowCheckedModeBanner: false,
  ));
}
