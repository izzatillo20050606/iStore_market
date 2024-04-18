import 'package:flutter/material.dart';
import 'package:phone_store/features/auth/view/pages/screens.dart';
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Screen(),
    );
  }
}
