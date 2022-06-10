import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../utils/utils_constant_and_size/constants.dart';
import '../../utils/utils_date_and_number_and_others/utils3.dart';
import '../tasks/widgets/task_list_widget.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({Key? key}) : super(key: key);

  static const id = "recycle_bin_screen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Recycle Task",
              style: Utils3.bodyTextStyleMedium(context: context)
                  .copyWith(color: kColorWhite),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    child: Text("${state.removedTasks.length}"),
                  ),
                ],
              )
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    "${state.removedTasks.length} Tasks",
                    style: Utils3.bodyTextStyleMedium(context: context),
                  ),
                ),
              ),
              TasksListWidget(tasksList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
