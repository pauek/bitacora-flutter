import 'package:flutter/material.dart';

class NoEntries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No entries',
        style: TextStyle(
          fontSize: 18,
          color: Colors.black.withAlpha(80),
        ),
      ),
    );
  }
}
