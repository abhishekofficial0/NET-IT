import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../dummy_data.dart';
import 'mytask_widget.dart';
import 'user_widget.dart';

class TaskToday extends StatelessWidget {
  List<dynamic> item;

  TaskToday({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
                children: item
                    .where((item) {
                      print(DateFormat("yyyy-MM-dd").format(DateTime.now()));
                      return item.assigned_date.contains(DateFormat("yyyy-MM-dd").format(DateTime.now()));
                    })
                    .map(
                      (data) => UserWidget(
                        data.name,
                        data.task_assigned_to,
                        data.task_grade,
                        data.task_status,
                        data.assigned_date,
                        data.due_date
                      ),
                    )
                    .toList(),
                    );
                    
  }
}

class TasksPending extends StatelessWidget {
  List<dynamic> item;

  TasksPending({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
                children: item
                    .where((item) {
                      return item.task_status.contains('ToDo');
                    })
                    .map(
                      (data) => UserWidget(
                        data.name,
                        data.task_assigned_to,
                        data.task_grade,
                        data.task_status,
                        data.assigned_date,
                        data.due_date
                      ),
                    )
                    .toList(),
                    );
  }
}

class TasksAll extends StatelessWidget {
  List<dynamic> item;

  TasksAll({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
                children: item
                    .map(
                      (data) => UserWidget(
                        data.name,
                        data.task_assigned_to,
                        data.task_grade,
                        data.task_status,
                        data.assigned_date,
                        data.due_date
                      ),
                    )
                    .toList(),
                    );
  }
}
