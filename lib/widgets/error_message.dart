
import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final Error error;
  ErrorMessage(this.error);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error reading database: ${error.toString()}'),
    );
  }
}
