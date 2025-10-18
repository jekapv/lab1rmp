import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Лабораторная №1')),
        body: Column(
          children: [
            Container(width: 200, height: 100, color: Colors.red),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Текст 1'),
                Text('Текст 2'),
                Text('Текст 3'),
              ],
            ),
            Container(width: 150, height: 80, color: Colors.green),
          ],
        ),
      ),
    );
  }
}