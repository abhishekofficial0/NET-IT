import 'package:flutter/material.dart';
import 'package:net_it/dummy_data.dart';

import 'mytask_widget.dart';

class TaskTodayMem extends StatefulWidget {
  const TaskTodayMem({Key? key}) : super(key: key);

  @override
  _TaskTodayMemState createState() => _TaskTodayMemState();
}

class _TaskTodayMemState extends State<TaskTodayMem> {
  @override
  Widget build(BuildContext context) {
    final membername = ModalRoute.of(context)!.settings.arguments as String;
    return ListView(
      children: DUMMY_USER_TASK_DATA
          .where((member) {
            return member.name.contains(membername);
          })
          .map(
            (task) => TaskListWidget(
                title: task.title,
                color: task.color,
                id: task.id.toString(),
                status: task.secondary_status),
          )
          .toList(),
    );
  }
}

class TaskPendingMem extends StatefulWidget {
  const TaskPendingMem({Key? key}) : super(key: key);

  @override
  _TaskPendingMemState createState() => _TaskPendingMemState();
}

class _TaskPendingMemState extends State<TaskPendingMem> {
  @override
  Widget build(BuildContext context) {
    final membername = ModalRoute.of(context)!.settings.arguments as String;

    return ListView(
      children: DUMMY_USER_TASK_DATA
          .where((member) {
            return member.name.contains(membername);
          })
          .map((task) => TaskListWidget(
              title: task.title,
              color: task.color,
              id: task.id.toString(),
              status: task.secondary_status))
          .toList(),
    );
  }
}

class TaksAllMem extends StatefulWidget {
  const TaksAllMem({Key? key}) : super(key: key);

  @override
  _TaksAllMemState createState() => _TaksAllMemState();
}

class _TaksAllMemState extends State<TaksAllMem> {
  @override
  Widget build(BuildContext context) {
    final membername = ModalRoute.of(context)!.settings.arguments as String;

    return ListView(
      children: DUMMY_USER_TASK_DATA
          .where((member) {
            return member.name.contains(membername);
          })
          .map(
            (task) => TaskListWidget(
                title: task.title,
                color: task.color,
                id: task.id.toString(),
                status: task.secondary_status),
          )
          .toList(),
    );
  }
}
