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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GeneratedScreens(count: _screenCount),
                  ),
                );
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
      body: count == 0
          ? Center(child: Text('No screens generated.'))
          : ListView.builder(
              itemCount: count,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Generated Screen ${index + 1}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => IndividualScreen(index: index + 1),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class IndividualScreen extends StatelessWidget {
  final int index;

  const IndividualScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generated Screen $index')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
