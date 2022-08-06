import 'package:flutter/cupertino.dart';

class Team {
  final String teamName;
  final String headName;
  final Color color;
  final String projects;
  final Image image;
  final String membersCount;

 const Team({
    required this.teamName,
    required this.headName,
    required this.color,
    required this.projects,
    required this.image,
    required this.membersCount,
  });
}
