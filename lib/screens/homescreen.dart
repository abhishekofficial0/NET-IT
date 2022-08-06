import 'package:flutter/material.dart';
import 'package:net_it/api/api_service.dart';
import 'package:net_it/models/login_model.dart';
import 'package:net_it/models/user_task.dart';
import 'package:net_it/widgets/user_widget.dart';
import '../dummy_data.dart';
import './create_new_task_screen.dart';
import './teams_list_screen.dart';
import './my_tasks_list.dart';
import './totalmemberscreen.dart';
import '../widgets/tasks_tabs_lists.dart';

class HomeScreen extends StatelessWidget {
  loginResponseModel user;
  UserTask task;
  List<dynamic> item;

  HomeScreen({required this.user, required this.item, required this.task,Key? key}): super(key: key);
  static const routeName = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                      ),
                      child: Text(
                        '${user.department.toUpperCase()} TEAM',
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
                            // top: 5,
                            left: 30,
                          ),
                          child: Text(
                            '${user.name} | Team ${user.role}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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
                  height: MediaQuery.of(context).size.height * 0.70,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TabBarView(
                    children: [
                      TaskToday(item: item,),
                      TasksPending(item: item,),
                      TasksAll(item: item,),
                    ],
                  ),
                ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  // boxShadow: kElevationToShadow[4],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(20),
                  ),
                  //color: Colors.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(MyTaskListScreen.routeName);
                      },
                      child: const Text(
                        'MY TASKS',
                        style: TextStyle(
                          color: Color(0xff6B6B6B),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 6.0,
                            offset: Offset(1.0, 0),
                          ),
                        ],
                        color: const Color(0xff6169BB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(NewTaskForm.routeName);
                        },
                        child: const Text(
                          'ADD TASKS',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(TeamsList.routeName);
                      },
                      child: const Text(
                        'TEAMS',
                        style: TextStyle(
                          color: Color(0xff6B6B6B),
                        ),
                      ),
                    ),
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
