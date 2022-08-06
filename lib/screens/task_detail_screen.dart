import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:net_it/dummy_data.dart';
import 'package:net_it/widgets/dropdown_status.dart';

class TaskDetailScreen extends StatelessWidget {
  static const routeName = 'task-detail';

  const TaskDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTaskId =
        DUMMY_USER_TASK_DATA.firstWhere((task) => task.id == taskId);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.06,
            right: MediaQuery.of(context).size.width * 0.06,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 3,
                  ),
                  child: Text(
                    selectedTaskId.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff545454),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  child: Text(
                    'GRADE ${selectedTaskId.grade} TASK',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xffBCBCBC),
                    ),
                  ),
                ),
                const Text(
                  'Description:',
                  style: TextStyle(color: Color(0xffBCBCBC), fontSize: 14),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffBCBCBC),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      'Create efficient design for homepage with appropriate colours',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text(
                    'Start Date:',
                    style: TextStyle(
                      color: Color(0xffBCBCBC),
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffBCBCBC),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text(
                    'Due Date:',
                    style: TextStyle(
                      color: Color(0xffBCBCBC),
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffBCBCBC),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Assigned To:',
                    style: TextStyle(
                      color: Color(0xffBCBCBC),
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffBCBCBC),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      selectedTaskId.name,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xffBCBCBC),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Attachments',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 20,
                    //left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.06,
                    bottom: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffBCBCBC),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: DropdownStatus(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 4.0,
                              spreadRadius: 5.0,
                              offset: const Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Close',
                            style: TextStyle(
                              color: Color(0xff797979),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 4.0,
                              spreadRadius: 5.0,
                              offset: const Offset(
                                  2.0, 2.0), // shadow direction: bottom right
                            ),
                          ],
                          color: const Color(0xff6169BB),
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
