import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ж/Д билеты',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TicketSearchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TicketSearchScreen extends StatefulWidget {
  const TicketSearchScreen({super.key});

  @override
  State<TicketSearchScreen> createState() => _TicketSearchScreenState();
}

class _TicketSearchScreenState extends State<TicketSearchScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // 🔹 Фоновое изображение (твоя ссылка)
          Image.network(
            'https://avatars.mds.yandex.net/get-altay/11908258/2a0000018ec3d3fce48c04edacdfcffc2a17/XXL_height',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // 🔹 Прозрачный слой поверх изображения
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
          ),

          // 🔹 Форма внизу экрана
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: screenSize.height * 0.05, // отступ от низа ~5%
                  left: 16,
                  right: 16,
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // чтобы контейнер не растягивался на весь экран
                    children: [
                      const Text('Откуда', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _fromController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Введите пункт отправления',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Divider(height: 32, thickness: 1),

                      const Text('Куда', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _toController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Введите пункт назначения',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const Divider(height: 32, thickness: 1),//что это?

                      const Text('Дата', style: TextStyle(color: Colors.grey)),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _dateController,//зачем контроллеры?
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Выберите дату',
                          hintStyle: TextStyle(color: Colors.grey[400]),
                        ),
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 24),

                      // 🔹 Кнопка с градиентом
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00B4DB), Color(0xFF0083B0)],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            String from = _fromController.text.isNotEmpty ? _fromController.text : 'Не указано';
                            String to = _toController.text.isNotEmpty ? _toController.text : 'Не указано';
                            String date = _dateController.text.isNotEmpty ? _dateController.text : 'Не указана';

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Ищем расписание... Откуда: $from, Куда: $to')),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              'Узнать расписание и цены',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}