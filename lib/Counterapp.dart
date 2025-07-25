
import 'package:flutter/material.dart';


class counterpage extends StatefulWidget{
  const counterpage({super.key});


  @override
  State<counterpage> createState() => counterpagestate();
}
class  counterpagestate extends State<counterpage>{
  int counter=0;
  void tang(){
    setState(() {
      counter++;
    });
  }
  void giam(){
    setState(() {
      counter=counter-1;
    });
  }
  void datlai(){
    setState(() {
      counter=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter app",style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor:Colors.lightBlue,
        centerTitle: true,
      ),
      body: Center(child: Column(
        children: [
          SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$counter",style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(onPressed: tang, label:Text("tăng") ,icon:Icon(Icons.add)),
              ElevatedButton.icon(onPressed: giam, label:Text("giảm") ,icon: Icon(Icons.remove)),
              ElevatedButton.icon(onPressed: datlai,label:Text("đặt lại") , icon:Icon(Icons.refresh))

            ],
          ),
        ],
      )
      ),

    );
  }

}

void main(){
  runApp(SafeArea(child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home:counterpage(),
  )));
}

