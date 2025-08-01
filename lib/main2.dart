import 'package:ff/provide/PlantScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'plant_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PlantProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Growth App',
      home: const PlantScreen(),
    );
  }
}
