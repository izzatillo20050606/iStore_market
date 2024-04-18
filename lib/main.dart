import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

late Box box;
late SharedPreferences preferences;
bool isFileSelected = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  box = await Hive.openBox('token');
  preferences = await SharedPreferences.getInstance();
   
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
