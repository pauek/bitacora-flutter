import 'package:bitacora/model/entry.dart';
import 'package:flutter/material.dart';

class EntryBox extends StatelessWidget {
  final Entry entry;
  EntryBox(this.entry);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                child: Text('${entry.text}'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3, bottom: 2),
                child: Text(
                  '${entry.hour}',
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
