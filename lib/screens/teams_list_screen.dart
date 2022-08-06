import 'package:flutter/material.dart';
import '../widgets/teams_list_widget.dart';
import '../dummy_data.dart';

class TeamsList extends StatelessWidget {
  static const routeName = 'teams-list';
  const TeamsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/topbar.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      //top: 15,
                      left: 30,
                    ),
                    child: Text(
                      'TEAMS / DEPARTMENTS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 5,
                          left: 30,
                        ),
                        child: Text(
                          'Which team would you wanna see?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.77,
                width: MediaQuery.of(context).size.width * 0.85,
                child: ListView(
                  children: DUMMT_TEAM_DATA
                      .map(
                        (data) => TeamListWidget(
                          data.teamName,
                          data.headName,
                          data.color,
                          data.projects,
                          data.image,
                          data.membersCount,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
