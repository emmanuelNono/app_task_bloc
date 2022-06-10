import 'package:app_task_bloc/models/task_model.dart';
import 'package:app_task_bloc/utils/utils_date_and_number_and_others/utils3.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import 'widgets/task_list_widget.dart';

class FavoriteTasksScreen extends StatelessWidget {
  const FavoriteTasksScreen({Key? key}) : super(key: key);

  static const id = "tasks_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.favoriteTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  "${tasksList.length} Tasks",
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
