import 'package:flutter/material.dart';
import 'screen_one.dart';
import 'screen_two.dart';
import 'screen_three.dart';
import 'dynamic_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advanced Navigation App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/screen1': (context) => ScreenOne(),
        '/screen2': (context) => ScreenTwo(),
        '/screen3': (context) => ScreenThree(),
        '/dynamic': (context) => DynamicScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => ErrorScreen());
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Navigation Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Screen 1'),
              onTap: () => Navigator.pushNamed(context, '/screen1', arguments: 'From Drawer'),
            ),
            ListTile(
              leading: Icon(Icons.navigate_next),
              title: Text('Screen 2'),
              onTap: () => Navigator.pushNamed(context, '/screen2'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Screen 3'),
              onTap: () => Navigator.pushNamed(context, '/screen3'),
            ),
            ListTile(
              leading: Icon(Icons.dynamic_feed),
              title: Text('Dynamic Routing'),
              onTap: () => Navigator.pushNamed(context, '/dynamic'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the Advanced Navigation App!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Error')),
      body: Center(
        child: Text('Route Not Found'),
      ),
    );
  }
}
