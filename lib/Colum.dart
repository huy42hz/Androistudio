import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              color: Colors.deepPurple[700],
              alignment: Alignment.center,
              child: Icon(Icons.favorite, color: Colors.red, size: 30),
            ),
            SizedBox(height: 20), // khoảng cách giữa các ô vuông
            Container(
              width: 60,
              height: 60,
              color: Colors.white,
              alignment: Alignment.center,
              child: Icon(Icons.access_time_filled, color: Colors.green, size: 30),
            ),
            SizedBox(height: 20,),
            Container(
              width: 60,
              height: 60,
              color: Colors.deepPurple[900],
              alignment: Alignment.center,
              child: Icon(Icons.abc, color: Colors.teal, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Test(),
  ));
}
