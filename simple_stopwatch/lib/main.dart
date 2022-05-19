import 'package:flutter/material.dart';

import 'ui/widgets/stopwatch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StopWatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StopWatch(),
    );
  }
}
