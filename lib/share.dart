import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Profile Saver',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        ),
      ),
      home: SharedPrefDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SharedPrefDemo extends StatefulWidget {
  @override
  _SharedPrefDemoState createState() => _SharedPrefDemoState();
}

class _SharedPrefDemoState extends State<SharedPrefDemo> {
  String? savedName;
  final TextEditingController _nameController = TextEditingController();
  bool _isSaving = false;

  Future<void> saveName(String name) async {
    setState(() => _isSaving = true);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', name);
    await loadName();
    setState(() => _isSaving = false);
  }

  Future<void> loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedName = prefs.getString('username');
    });
  }

  Future<void> _clearName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    loadName();
  }

  @override
  void initState() {
    super.initState();
    loadName();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar gradient
      appBar: AppBar(
        title: Text("Profile Saver"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          if (savedName != null)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _clearName,
              tooltip: 'Clear saved name',
            ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card hiển thị profile
            AnimatedSwitcher(
              duration: Duration(milliseconds: 400),
              child: Card(
                key: ValueKey(savedName),
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadowColor: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Saved Profile",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8),
                      savedName == null
                          ? Text(
                        "No profile saved yet",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                          : Text(
                        savedName!,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 32),
            Text(
              "Save New Profile",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),

            // TextField
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Enter your name",
                prefixIcon: Icon(Icons.person_outline),
                suffixIcon: IconButton(
                  icon: Icon(Icons.send_rounded),
                  onPressed: () {
                    if (_nameController.text.isNotEmpty) {
                      saveName(_nameController.text);
                      _nameController.clear();
                    }
                  },
                ),
              ),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  saveName(value);
                  _nameController.clear();
                }
              },
            ),

            SizedBox(height: 20),

            // Nút lưu
            ElevatedButton.icon(
              icon: _isSaving
                  ? SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
                  : Icon(Icons.save_rounded),
              label: Text(_isSaving ? 'Saving...' : 'Save Profile'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: _isSaving
                  ? null
                  : () {
                if (_nameController.text.isNotEmpty) {
                  saveName(_nameController.text);
                  _nameController.clear();
                }
              },
            ),

            SizedBox(height: 16),

            // Nút xóa
            if (savedName != null)
              OutlinedButton.icon(
                icon: Icon(Icons.delete_forever, color: Colors.red),
                label: Text("Clear Profile", style: TextStyle(color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: _clearName,
              ),
          ],
        ),
      ),
    );
  }
}
