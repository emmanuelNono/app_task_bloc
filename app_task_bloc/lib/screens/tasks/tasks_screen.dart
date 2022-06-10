import 'package:app_task_bloc/models/task_model.dart';
import 'package:app_task_bloc/utils/utils_constant_and_size/constants.dart';
import 'package:app_task_bloc/utils/utils_date_and_number_and_others/utils3.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../widgets/custom_widgets/custom_floating_action_button.dart';
import 'widgets/task_list_widget.dart';
import 'add_task_sscreen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                //MediaQuery.of(context).viewInsets.bottom => si clavier est visible, le champ de saisie reste au dessus du clavier
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Tasks App",
              style: Utils3.bodyTextStyleMedium(context: context)
                  .copyWith(color: kColorWhite),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    child: Text(
                      "9+",
                      style: Utils3.bodyTextStyleMedium(context: context)
                          .copyWith(color: kColorWhite),
                    ),
                  ),
                  IconButton(
                    onPressed: () => _addTask(context),
                    icon: Icon(
                      Icons.add,
                      size: Utils3.customIconSize(context: context),
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    "Tasks",
                    style: Utils3.bodyTextStyleMedium(context: context),
                  ),
                ),
              ),
              TasksListWidget(tasksList: tasksList),
            ],
          ),
          floatingActionButton: CustomFloatingActionButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addTask(context),
          ),
        );
      },
    );
  }
}
