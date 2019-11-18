import 'package:bitacora/model/entry.dart';
import 'package:bitacora/widgets/entry_box.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class EntryList extends StatelessWidget {
  final Box<Entry> box;
  const EntryList(this.box);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: box.length,
      itemBuilder: (context, index) => Row(
        children: <Widget>[
          EntryBox(box.getAt(index)),
        ],
      ),
    );
  }
}


