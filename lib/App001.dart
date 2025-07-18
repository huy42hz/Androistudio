import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "MyApp",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            "cuộc sống bất công vl",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.teal,
              fontSize: 22,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const[
              DrawerHeader(decoration: BoxDecoration(color: Colors.lightGreen,),
                child: Text("menu"),

              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("trang chủ"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("cài đặt"),
              )

            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // 👉 Hiện hộp thoại giữa màn hình
           showDialog(context: context, builder:(BuildContext context){
             return AlertDialog.adaptive(
               title: Text("thông báo"),
               content:Text("bạn đã nhấn nút thêm"),
               actions: [
                 TextButton(onPressed: (){
                   Navigator.of(context).pop();
                 },
                     child:Text("nhấn vào đây đi cậu"))
               ],
             );

           }

            );
          },
          backgroundColor: Colors.tealAccent,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: App(),
  ));
}
