import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task_model.dart';
import '../utils/utils_constant_and_size/constants.dart';
import '../utils/utils_date_and_number_and_others/utils3.dart';
import '../widgets/custom_widgets/custom_button.dart';
import '../widgets/custom_widgets/custom_textfield.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(children: [
        Text(
          "Add Task",
          style: Utils3.bodyTextStyleMedium(context: context)
              .copyWith(color: kColorOrange),
        ),
        const SizedBox(
          height: defaultPadding * 0.5,
        ),
        CustomTextField(
          controller: titleController,
          hintText: 'title',
          labelText: 'title',
          focusText: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: Utils3.bodyTextStyleMedium(context: context)
                    .copyWith(color: kColorOrange),
              ),
            ),
            CustomButton(
              onClicked: () {
                var task = TaskModel(title: titleController.text);
                context.read<TasksBloc>().add(AddTask(taskModel: task));

                Navigator.pop(context);
              },
              text: "Add",
              isArrondi: false,
              textFontColor: kColorOrange,
            ),
          ],
        ),
      ]),
    );
  }
}
