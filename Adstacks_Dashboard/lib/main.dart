
import 'package:adstacks_dashboard/screens/main_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashborad UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        scaffoldBackgroundColor: const Color(0xFF15131C),
        brightness: Brightness.dark,
      ),
      home: const MainScreen(),
    );
  }
}
