import 'package:flutter/material.dart';
import 'package:news_application/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(    
      title: 'NewsBazaar',
      debugShowCheckedModeBanner: false,
      home: _HomePageState(),
    );
  }
}

