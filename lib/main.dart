import 'package:flutter/material.dart';
import 'package:po2_mhwdata/presentation/pages/mian_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home:const Scaffold(
        body: MainPage()
        
      ),
      theme: ThemeData(
        useMaterial3: true
      ),
    );
  }
}
