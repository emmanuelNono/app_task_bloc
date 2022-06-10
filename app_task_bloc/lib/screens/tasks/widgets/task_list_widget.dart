import 'dart:ui';

import 'package:app_task_bloc/screens/tasks/widgets/task_tile_widget.dart';
import 'package:flutter/material.dart';
import '../../../models/task_model.dart';
import '../../../utils/utils_date_and_number_and_others/utils3.dart';

class TasksListWidget extends StatelessWidget {
  const TasksListWidget({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList
              .map((taskModel) => ExpansionPanelRadio(
                    value: taskModel.id,
                    headerBuilder: (context, isOpen) =>
                        TaskTileWidget(task: taskModel),
                    body: ListTile(
                      title: SelectableText.rich(
                        TextSpan(children: [
                          const TextSpan(
                            text: "Title\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: taskModel.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(
                            text: "\n\nDescription\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: taskModel.description,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}



// Expanded(
//       child: ListView.builder(
//           itemCount: tasksList.length,
//           itemBuilder: (context, index) {
//             var task = tasksList[index];
//             return TaskTileWidget(task: task);
//           }),
//     );
