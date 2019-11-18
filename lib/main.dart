import 'package:bitacora/model/entry.dart';
import 'package:bitacora/pages/log_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

void main() {
  Hive.registerAdapter(EntryAdapter(), 0);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitácora',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LogPage(),
    );
  }
}
