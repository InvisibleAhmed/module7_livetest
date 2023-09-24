/*
Kazi Shahed Ahmed
Flutter Batch - 04
Module-7: Live Test
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void incrementCount() {
    setState(() {
      count++;
      if (count >= 5) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Button pressed $count times."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Count:\n$count",
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.center, // This property is for aligning text within the Text widget
              ),
            ),

            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: incrementCount,
                  child: Text("+"),
                ),
                SizedBox(width: 24),
                ElevatedButton(
                  onPressed: decrementCount,
                  child: Text("-"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
