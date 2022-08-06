import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Members {
  final int id;
  final String categories;
  final String name;
  final String role;
  final String mailid;
  final String dateojoining;
  final String daysspent;
  final String birthdate;

const Members(
      {required this.id,
      required this.categories,
      required this.name,
      required this.role,
      required this.mailid,
      required this.dateojoining,
      required this.daysspent,
      required this.birthdate,
      });
}
