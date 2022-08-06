import 'package:flutter/material.dart';
import 'package:net_it/dummy_data.dart';
import 'package:net_it/screens/task_detail_screen.dart';

class TaskListWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  final String status;

  // ignore: use_key_in_widget_constructors
  const TaskListWidget({
    required this.title,
    required this.color,
    required this.id,
    required this.status,
  });
  //const TaskListWidget({Key? key}) : super(key: key);

  void _onTapTask(BuildContext context) {
    Navigator.of(context).pushNamed(
      TaskDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTapTask(context),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          //bottom: 10,
          left: 10,
          right: 10,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.11,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            // border: BoxBorder.lerp(a, b, t),
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),

            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
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
                      children: const [
                        Padding(
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
                          padding: EdgeInsets.only(
                            left: 4,
                            bottom: 8,
                          ),
                          child: Text(
                            '5th Oct',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
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
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '5th Oct',
                            style: TextStyle(
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
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6B6B6B),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.08,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Center(
                    child: Text(
                      status,
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
