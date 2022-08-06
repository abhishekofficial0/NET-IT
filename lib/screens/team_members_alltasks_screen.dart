import 'package:flutter/material.dart';
import 'package:net_it/dummy_data.dart';
import '../widgets/tasks_tabs_lists.dart';
import './totalmemberscreen.dart';

class TeamMembersAllTasksScreen extends StatelessWidget {
  static const routeName = 'teams-mem-alltask';
  const TeamMembersAllTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTeamName =
        ModalRoute.of(context)!.settings.arguments as String;
    final selectedTeamHead = DUMMT_TEAM_DATA
        .firstWhere((member) => member.teamName == selectedTeamName);

    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Column(
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
                    Padding(
                      padding: const EdgeInsets.only(
                        // top: 15,
                        left: 30,
                      ),
                      child: Text(
                        selectedTeamName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                            left: 30,
                          ),
                          child: Text(
                            '${selectedTeamHead.headName} | Team Head',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                         Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                alignment: Alignment.topCenter,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Totalmembersscreen(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.groups,
                                  size: 20,
                                  color: Color(0xff6169BB),
                                ),
                              ),
                              const Text(
                                '5',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff6169BB),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ],
                    ),
                  ],
                ),
              ),
              TabBar(
                  automaticIndicatorColorAdjustment: true,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.grey,
                  labelPadding: const EdgeInsets.all(0),
                  indicator: const UnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 5.0, color: Color(0xff6169BB)),
                      insets: EdgeInsets.symmetric(horizontal: 0.0)),
                  tabs: [
                    // To define tabs and also to show the count of list elements. Border is given to tabs as well as indicator.(4TABS)
                    Tab(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.grey),
                            right: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Today',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.grey),
                            right: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'Pending',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.grey),
                            right: BorderSide(width: 1.0, color: Colors.grey),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  'All',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TabBarView(
                  children: [
                    // TaskToday(item: item,),
                    // TasksPending(item: item,),
                    // TasksAll(item: item,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
