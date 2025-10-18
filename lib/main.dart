import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(radius: 40, backgroundColor: Colors.blue),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button pressed!');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}