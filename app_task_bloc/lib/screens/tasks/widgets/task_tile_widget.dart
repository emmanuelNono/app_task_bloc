import 'package:app_task_bloc/utils/utils_constant_and_size/constants.dart';
import 'package:flutter/material.dart';

import '../../../blocs/bloc_exports.dart';
import '../../../models/task_model.dart';
import '../../../utils/utils_date_and_number_and_others/utils3.dart';

class TaskTileWidget extends StatelessWidget {
  const TaskTileWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  final TaskModel task;

  void _removeOrDeleteTask(BuildContext ctx, TaskModel taskModel) {
    taskModel.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(taskModel: taskModel))
        : ctx.read<TasksBloc>().add(RemoveTask(taskModel: taskModel));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.title,
        overflow: TextOverflow.ellipsis,
        style: Utils3.bodyTextStyleMedium(context: context).copyWith(
            decoration: task.isDone! ? TextDecoration.lineThrough : null,
            color: kColorGrey,),
      ),
      trailing: Checkbox(
        onChanged: task.isDeleted!
            ? null
            : (value) {
                context.read<TasksBloc>().add(UpdateTask(taskModel: task));
              },
        value: task.isDone,
      ),
      onLongPress: () => _removeOrDeleteTask(context, task),
    );
  }
}
