import 'dart:async';
import 'package:flutter/material.dart';

class TyperWriter extends StatefulWidget {
  final String actualText;

  const TyperWriter({super.key, required this.actualText});

  @override
  State<TyperWriter> createState() => _TyperWriterState();
}

class _TyperWriterState extends State<TyperWriter> {
  String text = "";
  int _textLength = 0;
  int _index = -1;
  bool _isForward = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _textLength = widget.actualText.length;
    _index = 0;


    _timer = Timer.periodic(Duration(milliseconds: 250), (timer) {
      setState(() {
        if (_isForward) {
          _index++;
          if (_index > _textLength) {
            _index--;
            _isForward = false;
          }
        } else {
          _index--;
          if (_index < 0) {
            _index += 2;
            _isForward = true;
          }
        }
        text = widget.actualText.substring(0, _index) + '_';
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black38,
        decoration: TextDecoration.none,
        fontSize: 24,
      ),
    );
  }
}
