import 'package:flutter/material.dart';
import 'package:salamapp/theme/colors.dart';

class TaskManagement extends StatefulWidget {
  const TaskManagement({Key? key}) : super(key: key);

  @override
  State<TaskManagement> createState() => _TaskManagementState();
}

class _TaskManagementState extends State<TaskManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Zwhite,
      appBar: AppBar(
        backgroundColor: Zwhite,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Zred,
          ),
        ),
        title: Text(
          'Today Tasks',
          style: TextStyle(
            fontSize: 20,
            color: Zblack.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_task_outlined,
              color: Zred,
            ),
          )
        ],
      ),
      body: Center(
        child: Text(
          "Try adding task",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Zblack.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
