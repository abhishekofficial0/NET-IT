import 'package:flutter/material.dart';

import 'models/user_task.dart';
import './models/teams.dart';
import './models/members.dart';

// ignore: constant_identifier_names
const DUMMY_USER_TASK_DATA = [
      // UserTask(
      //   name: 'SHANMUGHA SUNDARAM',
      //   secondary_status: 'In progress',
      //   color: Color(0xffFFCA5D),
      //   title: 'Home Page UI Design',
      //   grade: '4',
      //   id: '1',
      //   primary_status: 'Not Done',
      //   description:
      //       'Create effective design for homepage with appropriate colors',
      // ),
      // UserTask(
      //   name: 'SHANMUGHA SUNDARAM',
      //   secondary_status: 'Incomplete',
      //   color: Color(0xffFF7777),
      //   title: 'Home Page UI Design',
      //   grade: '4',
      //   id: '1',
      //   primary_status: 'Not Done',
      //   description:
      //       'Create effective design for homepage with appropriate colors',
      // ),
      // UserTask(
      //   name: 'HARIPRASAD P',
      //   secondary_status: 'Complete',
      //   color: Color(0xff61AC78),
      //   title: 'Home Page UI Design',
      //   grade: '4',
      //   id: '1',
      //   primary_status: 'Done',
      //   description:
      //       'Create effective design for homepage with appropriate colors',
      // ),
      // UserTask(
      //   name: 'KARTHIKEYA S',
      //   secondary_status: 'To Do',
      //   color: Color(0xffB9B9B9),
      //   title: 'Home Page UI Design',
      //   grade: '4',
      //   id: '1',
      //   primary_status: 'Not Done',
      //   description:
      //       'Create effective design for homepage with appropriate colors',
      // ),
      // UserTask(
      //   name: 'SHANMUGHA SUNDARAM',
      //   secondary_status: 'In progress',
      //   color: Color(0xffFFCA5D),
      //   title: 'Home Page UI Design',
      //   grade: '4',
      //   id: '1',
      //   primary_status: 'Not Done',
      //   description:
      //       'Create effective design for homepage with appropriate colors',
      // ),
    ],

// ignore: non_constant_identifier_names, constant_identifier_names
    DUMMT_TEAM_DATA = [
      Team(
        teamName: 'DESIGN TEAM',
        headName: 'Hariprasad',
        color: Color(0xffF3F6FF),
        // image: null,
        projects: '3',
        membersCount: '5',
        image: Image(
          image: AssetImage('assets/images/team3.png'),
        ),
      ),
      Team(
        teamName: 'TECH TEAM',
        headName: 'Harish',
        color: Color(0xffF3F1ED),
        // image: null,
        projects: '3',
        membersCount: '5',
        image: Image(
          image: AssetImage('assets/images/team4.png'),
        ),
      ),
      Team(
        teamName: 'ACCOUNTS TEAM',
        headName: 'Ashwini',
        color: Color(0xffEDF8F0),
        // image: null,
        projects: '3',
        membersCount: '5',
        image: Image(
          image: AssetImage('assets/images/team1.png'),
        ),
      ),
      Team(
        teamName: 'ADMIN TEAM',
        headName: 'Vishnu',
        color: Color(0xffFFF8F8),
        // image: null,
        projects: '3',
        membersCount: '5',
        image: Image(
          image: AssetImage('assets/images/team2.png'),
        ),
      ),
    ],
//=======
    // ignore: non_constant_identifier_names
    // User(
    //  name: 'Shanmuga Sunadaram',
    //  status: 'In progress',
    // color: Colors.yellow,
    // title: 'Home Page UI Design',
    //  grade: '4',
    //  id: '1',
    //),
    //User(
    //  name: 'Shanmuga Sundaram',
    //  status: 'Incomplete',
    //  color: Colors.red,
    //  title: 'Home Page UI Design',
    // grade: '4',
    // id: '1',
    //),
    //User(
    //name: 'Shanmuga Sundaram',
    //status: 'Complete',
    //color: Colors.green,
    //title: 'Home Page UI Design',
    //grade: '4',
    //id: '1',
    //),
    ///User(
    //name: 'Shanmuga Sundaram',
    //status: 'To Do',
    //color: Colors.grey,
    //title: 'Home Page UI Design',
    //grade: '4',
    //id: '1',
    //),
    //User(
    //name: 'Shanmuga Sundaram',
    //status: 'In progress',
    //color: Colors.green,
    //title: 'Home Page UI Design',
    //grade: '4',
    //id: '1',
    //),
//];

    // ignore: non_constant_identifier_names
    DUMMY_MEMBERDATA = [
      Members(
        id: 1,
        categories: 'Active',
        name: 'SHANMUGHA SUNDARAM',
        role: 'Senior Designer',
        mailid: 'shanmugha@gmail.com',
        dateojoining: '4th Oct\'20',
        daysspent: '1yr 0m',
        birthdate: '15.09.1997',
      ),
      Members(
        id: 2,
        categories: 'Hold',
        name: 'KANAKA K',
        role: 'Junior Designer',
        mailid: 'Kanaka.k@gmail.com',
        dateojoining: '10th Oct\'20',
        daysspent: '1yr 0m',
        birthdate: '15.08.1997',
      ),
      Members(
        id: 3,
        categories: 'Active',
        name: 'HARIPRASAD P',
        role: 'Team Lead',
        mailid: 'hariprasad@gmail.com',
        dateojoining: '4th June\'20',
        daysspent: '1yr 4m',
        birthdate: '12.09.1998',
      ),
      Members(
        id: 4,
        categories: 'Inactive',
        name: 'KARTHIKEYA S',
        role: 'Accounts',
        mailid: 'kks@gmail.com',
        dateojoining: '1st Oct\'20',
        daysspent: '1yr 0m',
        birthdate: '11.05.1997',
      ),
      Members(
        id: 5,
        categories: 'Out',
        name: 'RITHU P',
        role: 'Media',
        mailid: 'Rithu@gmail.com',
        dateojoining: '4th Aug\'20',
        daysspent: '1yr 2m',
        birthdate: '15.09.1998',
      ),
      Members(
        id: 6,
        categories: 'Active',
        name: 'ASWINI',
        role: 'Accounts',
        mailid: 'Aswini@gmail.com',
        dateojoining: '4th Oct\'19',
        daysspent: '2yr 0m',
        birthdate: '12.01.1997',
      ),
    ];
