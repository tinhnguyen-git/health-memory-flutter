import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> fetchHello() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/hello'));
    return response.body;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Health Memory")),
        body: FutureBuilder<String>(
          future: fetchHello(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(child: Text(snapshot.data ?? "Error"));
          },
        ),
      ),
    );
  }
}
