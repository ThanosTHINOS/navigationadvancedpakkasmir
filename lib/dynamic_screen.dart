import 'package:flutter/material.dart';

class DynamicScreen extends StatefulWidget {
  @override
  _DynamicScreenState createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  int _screenCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Routing')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Enter number of screens'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _screenCount = int.tryParse(value) ?? 0;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GeneratedScreens(count: _screenCount)));
              },
              child: Text('Generate Screens'),
            ),
          ],
        ),
      ),
    );
  }
}

class GeneratedScreens extends StatelessWidget {
  final int count;

  const GeneratedScreens({required this.count});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generated Screens')),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return ListTile(title: Text('Generated Screen ${index + 1}'));
        },
      ),
    );
  }
}
