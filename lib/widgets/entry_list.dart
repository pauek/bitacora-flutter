import 'package:bitacora/model/entry.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class EntryList extends StatelessWidget {
  final Box<Entry> box;
  const EntryList(this.box);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: box.length,
      itemBuilder: (context, index) {
        return Container(
          child: Text('${box.getAt(index).text}'),
        );
      },
    );
  }
}
