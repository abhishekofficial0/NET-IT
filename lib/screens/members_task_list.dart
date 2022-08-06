import 'package:flutter/material.dart';
import 'package:net_it/dummy_data.dart';
import 'package:net_it/widgets/mytask_widget.dart';
import '../widgets/task_tabs_listfor_members.dart';

class MembersTaskListScreen extends StatelessWidget {
  static const routeName = 'task-members-list';
  //const MembersTaskListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final membername = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMember =
        DUMMY_MEMBERDATA.firstWhere((member) => member.name == membername);

    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    //bottom: 20,
                    ),
                child: Container(
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
                        child: InkWell(
                          onTap: () {
                            showDiagFunc(
                              context,
                              selectedMember.name,
                              selectedMember.mailid,
                              selectedMember.birthdate,
                              selectedMember.role,
                              selectedMember.dateojoining,
                            );
                          },
                          child: Text(
                            membername,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                    TaskTodayMem(),
                    TaskPendingMem(),
                    TaksAllMem(),
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

showDiagFunc(
  context,
  String name,
  String mailid,
  String birthdate,
  String role,
  String dateojoing,
) {
  return showDialog(
      useRootNavigator: false,
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 600,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "MEMBER DETAILS",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                         height: MediaQuery.of(context).size.height*0.0625,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextField(
                          enabled: false,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: name,
                              fillColor: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                   Spacer(),
                  Row(
                    children: [
                      Text(
                        "Email:",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                         height: MediaQuery.of(context).size.height*0.0625,
                       width: MediaQuery.of(context).size.width * 0.75,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: mailid,
                              fillColor: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "Date of Joining:",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                         height: MediaQuery.of(context).size.height*0.0625,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: dateojoing,
                              fillColor: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                   Spacer(),
                  Row(
                    children: [
                      Text(
                        "Date of Birth:",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                         height: MediaQuery.of(context).size.height*0.0625,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: birthdate,
                              fillColor: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "Role:",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.0625,
                      width: MediaQuery.of(context).size.width * 0.75,
                        child: TextField(
                          enabled: false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: role,
                              fillColor: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 115.0, top: 100),
                        child: Container(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(12), // <-- Radius
                              ),
                            ),
                            child: Text(
                              "Close",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
