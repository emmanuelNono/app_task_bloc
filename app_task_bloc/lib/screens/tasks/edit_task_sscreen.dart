import 'package:app_task_bloc/services/guid_gen.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../models/task_model.dart';
import '../../utils/utils_constant_and_size/constants.dart';
import '../../utils/utils_date_and_number_and_others/utils3.dart';
import '../../widgets/custom_widgets/custom_button.dart';
import '../../widgets/custom_widgets/custom_textfield.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Column(
      children: [
        Container(
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
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding),
              child: CustomTextField(
                controller: titleController,
                hintText: 'title',
                labelText: 'title',
                focusText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding),
              child: CustomTextField(
                controller: descriptionController,
                hintText: 'description',
                labelText: 'description',
                focusText: true,
                minLines: 3,
                maxLines: 5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    var task = TaskModel(
                        id: GUIDGen.generate(), //return un ID ss format String
                        title: titleController.text,
                        description: descriptionController.text);
                    // print("le ID generé est : ${task.id}");
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
        ),
      ],
    );
  }
}
