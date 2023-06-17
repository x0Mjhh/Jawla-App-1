import 'package:flutter/material.dart';

import 'Screen/detsils_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: details_page(),
        ),
      );
    
  }
}
