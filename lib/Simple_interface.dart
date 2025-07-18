
import 'package:flutter/material.dart';




class Simple_interface extends StatelessWidget{
  Simple_interface({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hồ sơ cá nhân",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.tealAccent[400],

      ),
      body: Padding(padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(backgroundImage: AssetImage("assets/images/Screenshot 2025-04-12 152248.png"),
              radius: 60,
            ),
            const SizedBox(height: 12),
            const Text(
              "Hoàng Văn Nhật Huy",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Sinh viên CNTT",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Expanded(child: ListView(
              children: [
                inforcard(icon: Icons.badge, label: "MSSV", value: "22T1020158"),
                inforcard(icon: Icons.school, label: "Lớp", value: "CNTT/Công nghệ phần mềm"),
                inforcard(icon: Icons.cake, label: "Ngày sinh", value: "01/01/2004"),
                inforcard(icon: Icons.email, label: "Email", value: "22t1020158@eHUSC.edu.com"),
                inforcard(icon: Icons.phone, label: "Số điện thoại", value: "0123 456 789"),
                inforcard(icon: Icons.location_city, label: "Trường", value: "Đại học Khoa học"),

              ],
            ))

          ],
        ),),
    );
  }
}
class inforcard extends StatelessWidget{
  final IconData icon;
  final String label;
  final String value;
  const inforcard(
      {super.key,
        required this.icon,
        required this.label,
        required this.value});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(leading: Icon(icon,color: Colors.teal,),title: Text(label),subtitle: Text(value),),
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12)),
    );
  }
}
void main(){
  runApp(SafeArea(child: MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Simple_interface(),
  )));
}