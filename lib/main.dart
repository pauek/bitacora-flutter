import 'package:bitacora/model/entry.dart';
import 'package:bitacora/pages/log_page.dart';
import 'package:bitacora/widgets/error_message.dart';
import 'package:bitacora/widgets/loading.dart';
import 'package:bitacora/widgets/no_entries.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  Hive.registerAdapter(EntryAdapter(), 0);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<Box<Entry>> _openDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    return await Hive.openBox<Entry>('entries');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitácora',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: FutureBuilder(
        future: _openDatabase(),
        builder: (context, AsyncSnapshot<Box<Entry>> snapshot) {
          if (snapshot.hasError) {
            return ErrorMessage(snapshot.error);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading();
          }
          Box<Entry> box = snapshot.data;
          if (box.isEmpty) {
            return NoEntries();
          }
          return LogPage();
        },
      ),
    );
  }
}
