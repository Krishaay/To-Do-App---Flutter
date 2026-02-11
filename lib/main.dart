import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/homepg.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // hive
  await Hive.initFlutter();
  // ignore: unused_local_variable
  await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // this is where variables & functions go, i guess..

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}