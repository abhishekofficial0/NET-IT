import 'package:flutter/material.dart';
import '../screens/team_members_alltasks_screen.dart';

class TeamListWidget extends StatelessWidget {
  final String teamName;
  final String headName;
  final Color color;
  final String projects;
  final Image image;
  final String membersCount;

  const TeamListWidget(this.teamName, this.headName, this.color, this.projects,
      this.image, this.membersCount,
      {Key? key})
      : super(key: key);

  // const TeamListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          TeamMembersAllTasksScreen.routeName,
          arguments: teamName,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 10,
          left: 2,
          right: 2,
        ),
        child: Container(
          //width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.165,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
                offset: Offset(1.0, 0),
              ),
            ],
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                MediaQuery.of(context).size.height * 0.1,
              ),
              bottomLeft: Radius.circular(
                MediaQuery.of(context).size.height * 0.1,
              ),
              topRight: const Radius.circular(20),
              bottomRight: const Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: CircleAvatar(
                  backgroundColor: color,
                  child: image,
                  radius: MediaQuery.of(context).size.height * 0.075,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        teamName,
                        style: const TextStyle(
                          color: Color(0xff4E506E),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          '$headName | Team Head',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff4E506E),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.groups),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              '$membersCount Members',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Start date:',
                            style: TextStyle(
                              fontSize: 8,
                            ),
                          ),
                          Text('5th Oct \'21'),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Projects',
                            style: TextStyle(fontSize: 8),
                          ),
                          Text('Total $projects'),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
