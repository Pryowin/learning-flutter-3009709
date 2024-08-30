// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  final Color buttonColor;
  const CounterStateful({Key? key, required this.buttonColor})
      : super(key: key);

  @override
  State<CounterStateful> createState() {
    State<CounterStateful> stateClassAssociatedWithThisWidget =
        _CounterStatefulState();
    return stateClassAssociatedWithThisWidget;
  }
}

class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          centerTitle: true,
          title: const Text('Counter'),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: widget.buttonColor,
          child: const Icon(Icons.add),
          onPressed: () {
            increment();
          },
        ),
        body: Center(
          child: Text(
            '$counter',
            style: TextStyle(fontSize: 30),
          ),
        ));
  }
}
