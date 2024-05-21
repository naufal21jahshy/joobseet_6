import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahasiswa Bergantian',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Mahasiswa Bergantian'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _listNama = [
    'Bagus',
    'Budi',
    'Andi',
    'Sari',
    'Rudi',
    'Nurul',
    'Huda',
    'Lendis',
    'Fabri'
  ];

  final List<Color> _listWarna = [
    Colors.red,
    Color.fromARGB(255, 176, 176, 39),
    Color.fromARGB(255, 0, 150, 7),
    const Color.fromARGB(255, 103, 57, 220),
    const Color.fromARGB(255, 181, 63, 167),
    Color.fromARGB(255, 183, 58, 102),
    Color.fromARGB(255, 123, 66, 12),
    Color.fromARGB(255, 11, 50, 82),
    Color.fromARGB(255, 138, 156, 139)
  ];

  int _index = 0;

  void _refreshStudent() {
    setState(() {
      _index = (_index + 1) % _listNama.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Apa kabar',
              textDirection: TextDirection.ltr,
            ),
            Text(
              _listNama[_index],
              style: TextStyle(
                fontSize: 24,
                color: _listWarna[_index % _listWarna.length],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshStudent,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}