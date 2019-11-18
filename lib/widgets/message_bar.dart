import 'package:flutter/material.dart';

class MessageBar extends StatefulWidget {
  final double elevation;
  final Function(String) onMessage;
  MessageBar({ this.elevation = 2.0, this.onMessage });

  @override
  _MessageBarState createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  _onMessage(String message) {
    if (widget.onMessage != null) {
      widget.onMessage(message);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Material(
              elevation: widget.elevation,
              shape: StadiumBorder(),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  onSubmitted: _onMessage,
                ),
              ),
            ),
          ),
        ),
        Material(
          elevation: widget.elevation,
          color: Theme.of(context).primaryColor,
          shape: StadiumBorder(),
          clipBehavior: Clip.antiAlias,
          child: IconButton(
            icon: Icon(Icons.send),
            color: Colors.white,
            onPressed: () => _onMessage(_controller.text),
          ),
        ),
        SizedBox(width: 6),
      ],
    );
  }
}
