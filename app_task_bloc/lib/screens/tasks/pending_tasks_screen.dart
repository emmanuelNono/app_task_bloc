import 'package:app_task_bloc/models/task_model.dart';
import 'package:app_task_bloc/utils/utils_date_and_number_and_others/utils3.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import 'widgets/task_list_widget.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);

  static const id = "tasks_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  "${tasksList.length} Panding | ${state.completedTasks.length} Completed",
                  style: Utils3.bodyTextStyleMedium(context: context),
                ),
              ),
            ),
            TasksListWidget(tasksList: tasksList),
          ],
        );
      },
    );
  }
}
