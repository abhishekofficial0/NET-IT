import 'package:flutter/material.dart';
import 'package:net_it/dummy_data.dart';
import 'package:net_it/screens/create_new_task_screen.dart';
import 'package:net_it/widgets/tasks_tabs_lists.dart';
import '../widgets/mytask_widget.dart';

class MyTaskListScreen extends StatelessWidget {
  List<dynamic> item;
  static const routeName = 'my-task-list';
  MyTaskListScreen({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const Padding(
                      padding: EdgeInsets.only(
                       // top: 15,
                        left: 30,
                      ),
                      child: Text(
                        'Hi Hariprasad!',
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
                            'Have a look at your tasks',
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
                height: MediaQuery.of(context).size.height * 0.6,
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
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(NewTaskForm.routeName);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: const Color(0xff6169BB),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 7),
                              child: Icon(
                                Icons.add_task,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'ADD TASK',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
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
