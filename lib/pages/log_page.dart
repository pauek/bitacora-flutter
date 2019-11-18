import 'package:bitacora/model/entry.dart';
import 'package:bitacora/widgets/entry_list.dart';
import 'package:bitacora/widgets/error_message.dart';
import 'package:bitacora/widgets/loading.dart';
import 'package:bitacora/widgets/message_bar.dart';
import 'package:bitacora/widgets/no_entries.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class LogPage extends StatelessWidget {
  Future<Box<Entry>> _openDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    return await Hive.openBox<Entry>('entries');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Colors.teal[50]),
          Column(
            children: <Widget>[
              Expanded(
                child: FutureBuilder(
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
                    return EntryList(box);
                  },
                ),
              ),
              MessageBar(
                onMessage: (msg) => print(msg),
              ),
            ],
          )
        ],
      ),
    );
  }
}
