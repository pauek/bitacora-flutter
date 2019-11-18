import 'package:bitacora/model/entry.dart';
import 'package:bitacora/widgets/entry_list.dart';
import 'package:bitacora/widgets/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class LogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(color: Colors.teal[50]),
          Column(
            children: <Widget>[
              Expanded(
                child: WatchBoxBuilder(
                  box: Hive.box<Entry>('entries'),
                  builder: (context, Box box) => EntryList(box),
                ),
              ),
              MessageBar(
                onMessage: (text) {
                  final entry = Entry.fromText(text);
                  Hive.box<Entry>('entries').put(entry.id, entry);
                }
              ),
            ],
          )
        ],
      ),
    );
  }
}
