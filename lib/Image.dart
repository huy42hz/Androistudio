import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DogImageScreen(),
  ));
}

class DogImageScreen extends StatelessWidget {
  const DogImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCEEFF), // Nền màu hồng nhạt
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8), // Bo tròn nhẹ nếu cần
          child: Image.asset(
            'assets/images/we-have-no-sappers-dog-accepting-fate (1).gif', // Đường dẫn đến ảnh trong thư mục assets
            width: 200,
            height: 200,

          ),
        ),
      ),
    );
  }
}
