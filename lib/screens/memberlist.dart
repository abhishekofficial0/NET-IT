import 'package:flutter/material.dart';
import 'package:net_it/dummy_data.dart';
import 'package:net_it/models/members.dart';
import 'package:net_it/widgets/member_item.dart';

class CategoryActive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryactivemembers = DUMMY_MEMBERDATA.where((member) {
      return member.categories.contains("Active");
    }).toList();
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return Memberitemcard(
              id: categoryactivemembers[index].id.toString(),
              name: categoryactivemembers[index].name,
              role: categoryactivemembers[index].role,
              mailid: categoryactivemembers[index].mailid,
              dateojoining: categoryactivemembers[index].dateojoining,
              daysspent: categoryactivemembers[index].daysspent,
              birthdate: categoryactivemembers[index].birthdate,
            );
          },
          itemCount: categoryactivemembers.length,
        ),
      ),
    );
  }
}

class CategoryInactive extends StatelessWidget {
  const CategoryInactive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryactivemembers = DUMMY_MEMBERDATA.where((member) {
      return member.categories.contains("Inactive");
    }).toList();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Memberitemcard(
            id: categoryactivemembers[index].id.toString(),
            name: categoryactivemembers[index].name,
            role: categoryactivemembers[index].role,
            mailid: categoryactivemembers[index].mailid,
            dateojoining: categoryactivemembers[index].dateojoining,
            daysspent: categoryactivemembers[index].daysspent,
            birthdate: categoryactivemembers[index].birthdate,
          );
        },
        itemCount: categoryactivemembers.length,
      ),
    );
  }
}

class CategoryHold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryactivemembers = DUMMY_MEMBERDATA.where((member) {
      return member.categories.contains("Hold");
    }).toList();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Memberitemcard(
            id: categoryactivemembers[index].id.toString(),
            name: categoryactivemembers[index].name,
            role: categoryactivemembers[index].role,
            mailid: categoryactivemembers[index].mailid,
            dateojoining: categoryactivemembers[index].dateojoining,
            daysspent: categoryactivemembers[index].daysspent,
            birthdate: categoryactivemembers[index].birthdate,
          );
        },
        itemCount: categoryactivemembers.length,
      ),
    );
  }
}

class CategoryOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryactivemembers = DUMMY_MEMBERDATA.where((member) {
      return member.categories.contains("Out");
    }).toList();
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Memberitemcard(
            id: categoryactivemembers[index].id.toString(),
            name: categoryactivemembers[index].name,
            role: categoryactivemembers[index].role,
            mailid: categoryactivemembers[index].mailid,
            dateojoining: categoryactivemembers[index].dateojoining,
            daysspent: categoryactivemembers[index].daysspent,
            birthdate: categoryactivemembers[index].birthdate,
          );
        },
        itemCount: categoryactivemembers.length,
      ),
    );
  }
}
