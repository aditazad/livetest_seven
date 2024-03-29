import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 0;

  void _incrementCount() {
    setState(() {
      count++;
      if (count >= 5) {
        _showDialog(count);
      }
    });
  }

  void _decrementCount() {
    setState(() {
      if (count > 0) {
        count--;
      }
    });
  }

  Future<void> _showDialog(int count) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Button pressed $count times"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$count',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementCount,
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 30, // Adjust the button text size
                      fontWeight: FontWeight.bold, // Make text bold
                    ),
                  ),
                  child: Text('+'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _decrementCount,
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 30, // Adjust the button text size
                      fontWeight: FontWeight.bold, // Make text bold
                    ),
                  ),
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
