import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Collapsible Sidebar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CollapsibleSidebar(),
    );
  }
}

class CollapsibleSidebar extends StatefulWidget {
  @override
  _CollapsibleSidebarState createState() => _CollapsibleSidebarState();
}

class _CollapsibleSidebarState extends State<CollapsibleSidebar> {
  bool _isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collapsible Sidebar'),
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _isCollapsed ? 70 : 250,
            color: Colors.blue,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
                if (!_isCollapsed) ...[
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text('Home', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text('Profile', style: TextStyle(color: Colors.white)),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.white),
                    title: Text('Settings', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Main Content Area'),
            ),
          ),
        ],
      ),
    );
  }
}
