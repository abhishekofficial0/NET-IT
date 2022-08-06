import 'package:flutter/foundation.dart';

class Data {
  final String id;
  final String name;
  final String description;
  final String task_assigned_by;
  final String task_assigned_to;
  final String task_status;
  final int task_grade;
  final String assigned_date;
  final String due_date;
  final String slug;

  Data(
      {
        required this.id,
        required this.name,
        required this.description,
        required this.task_assigned_by,
        required this.task_assigned_to,
        required this.task_status,
        required this.task_grade,
        required this.assigned_date,
        required this.due_date,
        required this.slug,
        });

}




class UserTask {
  final bool success;
  final int count;
  final Map<String, dynamic> pagination;
  final List<dynamic> data;

  const UserTask({
    required this.success,
    required this.count,
    required this.pagination,
    required this.data,
  });

  factory UserTask.fromJson(Map<String, dynamic> json) {
    return UserTask(
      success: json["success"] ?? false,
      count: json["count"] ?? -1,
      pagination: json["pagination"] ?? {},
      data: json["data"] ?? [],
    );
  }
}
