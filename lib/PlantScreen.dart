import 'package:ff/provide/plant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Plant = Provider.of<PlantProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("App tưới cây"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: const [
          Icon(Icons.eco), // biểu tượng cây cỏ
          SizedBox(width: 12),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Plant.getno
                  ? 'Cây đã nở hoa!'
                  : 'Mức độ phát triển: ${Plant.gettuoi}/5',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Icon(
              Plant.getno ? Icons.local_florist : Icons.eco,
              color: Plant.getno ? Colors.pink : Colors.green,
              size: 100,
            ),
            const SizedBox(height: 30),


            ElevatedButton.icon(
              onPressed: Plant.getno ? null : Plant.tuoicay,
              icon: const Icon(Icons.water_drop), // biểu tượng giọt nước
              label: const Text('Tưới cây'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),

            const SizedBox(height: 30),


            TextButton.icon(
              onPressed: Plant.datlai,
              icon: const Icon(Icons.restart_alt), // biểu tượng reset
              label: const Text('Trồng lại'),
            ),
          ],
        ),
      ),
    );
  }
}
