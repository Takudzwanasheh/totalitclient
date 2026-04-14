import 'package:flutter/material.dart';
import 'package:totaliclient/customers/screen/CustomersScreen.dart';

import 'home/screen/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          top: true,    
          bottom: true, 
          left: false,
          right: false,
          child: MainPage()),

    );
  }
}
