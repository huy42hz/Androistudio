import 'package:flutter/material.dart';
class App2 extends StatelessWidget{
  const App2({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),

        ),

        body: Padding(
            padding: const EdgeInsets.only(top: 200), // khoảng cách với AppBar
            child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            ElevatedButton(onPressed: (){}, child: Container(
              height: 20,
              width: 20,
              color: Colors.lightGreen,
            )),
            ElevatedButton(onPressed: (){}, child: Container(
              height: 20,
              width: 20,
              color: Colors.lightGreen,
            )),
            ElevatedButton(onPressed: (){}, child: Container(
              height: 20,
              width: 20,
              color: Colors.lightGreen,
            ))
          ],

        ))


        ),
      ),
    );
  }
}
void main(){
  runApp(App2());
}
