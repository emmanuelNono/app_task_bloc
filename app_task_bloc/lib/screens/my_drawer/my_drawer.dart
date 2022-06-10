import 'package:app_task_bloc/screens/my_drawer/recycle_bin.dart';
import 'package:app_task_bloc/utils/utils_constant_and_size/constants.dart';
import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../utils/utils_date_and_number_and_others/utils3.dart';
import '../../widgets/custom_widgets/svg_icon.dart';
import '../tasks/tabs_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: defaultPadding * 0.5),
              width: double.infinity,
              color: kColorGrey,
              child: Text(
                "The drawer",
                style: Utils3.bodyTextStyleMedium(context: context)
                    .copyWith(color: kColorRed),
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return DrawerListTile(
                  title: "My Tasks",
                  svgSrc: "assets/icons/menu_dashbord.svg",
                  trailingText:
                      "${state.pendingTasks.length} | ${state.completedTasks.length}",
                  press: () {
                    Navigator.pop(context);

                    // Navigator.of(context).pushNamed(TasksScreen.id);
                    Navigator.pushReplacementNamed(context, TabsScreen.id);
                  },
                );
              },
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return DrawerListTile(
                  title: "Recycle Bin",
                  svgSrc: "assets/icons/media.svg",
                  trailingText: "${state.removedTasks.length}",
                  press: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, RecycleBin.id);
                  },
                );
              },
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<SwitchBloc>().add(SwitchOnEvent())
                        : context.read<SwitchBloc>().add(SwitchOffEvent());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.trailingText,
  }) : super(key: key);

  final String title, trailingText, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgIcon(
        src: svgSrc,
        color: Theme.of(context).iconTheme.color!,
        size: defaultSize,
      ),
      title: Text(
        title,
        style: Utils3.bodyTextStyleMedium(context: context, isbold: true)
            .copyWith(color: kColorGrey),
      ),
      trailing: Text(
        trailingText,
        style: Utils3.bodyTextStyleMedium(context: context, isbold: true),
      ),
    );
  }
}
