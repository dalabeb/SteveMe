import 'package:flutter/material.dart';

void main() {
  runApp(TimeRolesApp());
}

class TimeRolesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Roles',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: RolesScreen(),
    );
  }
}

class RolesScreen extends StatefulWidget {
  @override
  _RolesScreenState createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  List<String> roles = ['Художник', 'Учёный', 'Друг'];
  TextEditingController controller = TextEditingController();

  void _addRole(String role) {
    setState(() {
      roles.add(role);
    });
    controller.clear();
  }

  void _goToCircleScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CircleScreen(roles: roles)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Роли'),
        actions: [
          IconButton(
            icon: Icon(Icons.pie_chart_outline),
            onPressed: _goToCircleScreen,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: roles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(roles[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: 'Новая роль'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => _addRole(controller.text),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CircleScreen extends StatelessWidget {
  final List<String> roles;
  CircleScreen({required this.roles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Круг приоритетов')),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigo[100],
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigo[300],
              ),
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigo[600],
              ),
              child: Center(
                child: Text('50%', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}