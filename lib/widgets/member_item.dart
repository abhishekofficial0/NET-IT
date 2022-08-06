import 'package:flutter/material.dart';
import 'package:net_it/models/members.dart';
import 'package:net_it/screens/members_task_list.dart';
//import 'package:net_it/screens/memberdetailscreen.dart';

class Memberitemcard extends StatelessWidget {
  final String id;
  final String name;
  final String role;
  final String mailid;
  final String dateojoining;
  final String daysspent;
  final String birthdate;

  Memberitemcard(
      {required this.id,
      required this.name,
      required this.role,
      required this.mailid,
      required this.dateojoining,
      required this.daysspent,
      required this.birthdate});
  // void selectMember(BuildContext context) {
  //   Memberdetailscreen();
  //   // Navigator.of(context).pushNamed(
  //   //   Memberdetailscreen.routeName,
  //  //   arguments: id,

  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          MembersTaskListScreen.routeName,
          arguments: name,
        );
      },
      // Memberdetailscreen(),
      //selectMember(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.86,
          // height: 110,
          //MediaQuery.of(context).size.height * 1.38,
          //110,
          // width: MediaQuery.of(context).size.width * 0.32,
          child: Card(
            color: Color(0xFFF8F8F8),
            //Colors.blueGrey[50],
            elevation: 6,
            shadowColor: Color.fromRGBO(0, 0, 0, 0.16),
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Stack(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 11.0, right: 5.0, top: 9.0, bottom: 0),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.20,
                                //   color: Colors.red,
                                child: Text(
                                  "Joining Date",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff757575),
                                    fontSize: 8.0,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 11.0, right: 5.0, top: 0.0, bottom: 5.0),
                          child: Row(
                            children: [
                              Container(
                                //color: Colors.red,
                                width: MediaQuery.of(context).size.width * 0.20,
                                height: 17,
                                child: Text(
                                  dateojoining,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff757575),
                                      fontSize: 12),
                                  textAlign: TextAlign.left,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 11.0, right: 5.0, top: 0.0, bottom: 0.0),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.20,
                                // color: Colors.red,
                                child: Text(
                                  "Days Spent",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff757575),
                                      fontSize: 8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 11.0, right: 5.0, top: 0.0, bottom: 8.0),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.20,
                                height: 17,
                                child: Text(
                                  daysspent,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff757575),
                                    fontSize: 12,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.0,
                                offset: Offset(2.0, 0),
                                color: Color.fromRGBO(0, 0, 0, 0.16),
                                //Color(0xff757575),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height * 0.12,
                          // width: MediaQuery.of(context).size.width * 0.86,
                          width: 2,
                          //   height: 90,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 8.0, top: 9.0, bottom: 0.0),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 20,
                                child: Text(
                                  name,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff757575),
                                    fontSize: 14,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 8.0, top: 2.0, bottom: 0.0),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 17,
                                child: Text(
                                  role,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                      color: Color(0xff757575),
                                      fontSize: 12),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 8.0, top: 3.0, bottom: 9.0),
                          child: Row(
                            children: [
                              Container(
                                // color: Colors.red,
                                width: MediaQuery.of(context).size.width * 0.5,
                                height: 15,
                                child: Text(
                                  mailid,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff757575),
                                    fontSize: 10,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDiagFunc(context,) {
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
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
                          width: 320.0,
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
                          width: 320.0,
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
                          width: 320.0,
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
                          width: 320.0,
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
// Row(
//   children: [
//     TextFormField(
//       readOnly: true,
//       decoration: const InputDecoration(
//            border: OutlineInputBorder(),
//           labelText: 'Enter your username'),
//     ),
//   ],
// ),
