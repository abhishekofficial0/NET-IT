import 'package:flutter/material.dart';
import 'package:net_it/models/login_model.dart';
import 'package:net_it/models/user_task.dart';
//import 'package:net_it/screens/memberdetailscreen.dart';
import './screens/loginscreen.dart';
import './screens/createnewpassscreen.dart';
import './screens/forgotpassscreen.dart';
import './screens/homescreen.dart';
import './screens/create_new_task_screen.dart';
import './screens/teams_list_screen.dart';
import './screens/my_tasks_list.dart';
import './screens/task_detail_screen.dart';
import './screens/members_task_list.dart';
import './screens/team_members_alltasks_screen.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  loginResponseModel? user;
  UserTask? task;
  List<dynamic>? item;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Axiforma'),
      home: const SplashScreen(),
      routes: {
        CreateNewPassScreen.routeName: (ctx) => CreateNewPassScreen(user: user!,task: task!,item: item!),
        ForgotPassScreen.routeName: (ctx) => const ForgotPassScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(user: user!,task: task!,item: item!),
        NewTaskForm.routeName: (ctx) => const NewTaskForm(),
        TeamsList.routeName: (ctx) => const TeamsList(),
        MyTaskListScreen.routeName: (ctx) => MyTaskListScreen(item: item!),
        TaskDetailScreen.routeName: (ctx) => const TaskDetailScreen(),
        MembersTaskListScreen.routeName: (ctx) => MembersTaskListScreen(),
        TeamMembersAllTasksScreen.routeName: (ctx) =>
            const TeamMembersAllTasksScreen(),
        TaskDetailScreen.routeName: (ctx) => const TaskDetailScreen(),
        SplashScreen.routeName: (ctx) => const SplashScreen(),
        LoginScreenPage.routeName: (ctx) => const LoginScreenPage(),
      //  Memberdetailscreen.routeName:(ctx) => Memberdetailscreen(),
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=>HomeScreen(user: user!, task: task!,item: item!));
        
      },
    );
  }
}
