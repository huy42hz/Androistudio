import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inter extends StatelessWidget {
  const Inter({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      "Use name:",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                 Expanded(child: TextField(
                 decoration: InputDecoration(

                   hintText: "nhập tên của bạn",
                   border: OutlineInputBorder(),
                 ),

                 ),
                 )
                ],
              ),
              
            ],

          ),
        )
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Inter(),
  ));
}
