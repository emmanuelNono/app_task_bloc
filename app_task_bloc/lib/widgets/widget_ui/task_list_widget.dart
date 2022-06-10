import 'package:flutter/material.dart';

import '../../models/task_model.dart';
import '../../utils/utils_date_and_number_and_others/utils3.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: tasksList.length,
          itemBuilder: (context, index) {
            var task = tasksList[index];
            return ListTile(
              title: Text(
                task.title,
                style: Utils3.bodyTextStyleMedium(context: context),
              ),
              trailing: Checkbox(
                onChanged: (value) {},
                value: task.isDone,
              ),
            );
          }),
    );
  }
}
