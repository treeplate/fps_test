import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double fps = double.infinity;
  Duration previousDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    createTicker(tick).start();
  }

  void tick(Duration d) {
    setState(() {
      fps =
          1 /
          ((d - previousDuration).inMicroseconds /
              Duration.microsecondsPerSecond);
    });
    previousDuration = d;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('FPS: ${fps.toStringAsFixed(2)}')));
  }
}
