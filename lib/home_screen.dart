import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_listview_selection/task.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _multiSelectionIsEnabled = false;

  var items = <Task>[
    Task("Tarefa 1"),
    Task("Tarefa 2"),
    Task("Tarefa 3"),
    Task("Tarefa 4"),
    Task("Tarefa 5"),
    Task("Tarefa 6"),
    Task("Tarefa 7"),
    Task("Tarefa 8"),
    Task("Tarefa 9"),
    Task("Tarefa 10"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Selection"),
        actions: _multiSelectionIsEnabled
            ? <Widget>[
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _multiSelectionIsEnabled = false;
                    });
                  },
                )
              ]
            : null,
      ),
      body: _buildList(),
    );
  }

  _buildList() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        var task = items[index];
        var leadingIcon =
            _multiSelectionIsEnabled ? Icon(Icons.check_circle_outline) : null;
        return ListTile(
          leading: leadingIcon,
          title: Text(task.title),
          subtitle: Text(task.description),
          onTap: () {
            setState(() {
              leadingIcon = task.isSelected
                  ? Icon(Icons.check_circle)
                  : Icon(Icons.check_circle_outline);
            });
          },
          onLongPress: () {
            setState(() {
              _multiSelectionIsEnabled = true;
            });
          },
        );
      },
    );
  }
}
