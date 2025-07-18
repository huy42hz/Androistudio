import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "hello",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.black,
        centerTitle: true, // Căn giữa tiêu đề
        elevation: 10,     // Đổ bóng dưới AppBar
        actions: [         // Thêm icon bên phải AppBar
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Hành động khi nhấn icon
              print("Search icon pressed");
            },
          ),
        ],
      ),

      body: const Center(
        child: Text(
          "tôi sẽ được điểm A",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
            fontFamily:'Time New Roman',
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB pressed");
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),

      backgroundColor: Colors.grey[200], // Màu nền của toàn bộ body

      drawer: Drawer( // Menu trượt bên trái
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Trang chủ'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Cài đặt'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Tắt chữ debug
    home: MyScaffold(),
  ));
}
