import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:net_it/screens/task_detail_screen.dart';

class UserWidget extends StatelessWidget {
  final String task_assigned_to;
  final String name;
  final String task_status;
  final int task_grade;
  final String startdate;
  final String duedate;
  final String th = 'th';
  final Color state =  const Color(0xffFFCA5D);


  Color one(task_status){
    if(task_status == 'ToDo'){
      return const Color(0xffB9B9B9);
    }
    else if(task_status == 'In Progress'){
      return const Color(0xffFFCA5D);
    }
    else if(task_status == 'Complete'){
      return const Color(0xff61AC78);
    }
    else if(task_status == 'Incomplete'){
      return const Color(0xffFF7777);
    }
    else {
      return const Color(0xffB9B9B9);
    }
  }

   // ignore: use_key_in_widget_constructors
  const UserWidget(
    this.name,
    this.task_assigned_to,
    this.task_grade,
    this.task_status,
    this.startdate,
    this.duedate
  );
  // const UserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(TaskDetailScreen.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 15,
          left: 10,
          right: 10,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.11,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
                offset: Offset(1.0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: const Image(
                        image: AssetImage('assets/images/dotline.png'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 4,
                          ),
                          child: Text(
                            'Start date:',
                            style: TextStyle(
                              color: Color(0xff6B6B6B),
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                            bottom: 8,
                          ),
                          child: Text(
                            DateFormat("dd'$th' MMM-yy").format(DateTime.parse(startdate)),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 4,
                          ),
                          child: Text(
                            'Due date:',
                            style: TextStyle(
                              color: Color(0xff6B6B6B),
                              fontSize: 8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            DateFormat("dd'$th' MMM-yy").format(DateTime.parse(duedate)),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                thickness: 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                  Text(
                    task_assigned_to,
                    style: const TextStyle(
                      color: Color(0xff6B6B6B),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Grade : ',
                        style: TextStyle(
                          color: Color(0xff6D6D6D),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        task_grade.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.08,
                decoration: BoxDecoration(
                  color: one(task_status),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Center(
                    child: Text(
                      task_status,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
