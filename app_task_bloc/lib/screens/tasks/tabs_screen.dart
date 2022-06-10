import 'package:app_task_bloc/screens/my_drawer/my_drawer.dart';
import 'package:app_task_bloc/screens/tasks/pending_tasks_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/utils_constant_and_size/constants.dart';
import '../../utils/utils_date_and_number_and_others/utils3.dart';
import '../../widgets/custom_widgets/custom_floating_action_button.dart';
import 'completed_tasks_screen.dart';
import 'edit_task_sscreen.dart';
import 'favorite_tasks_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDtetails = [
    {"pageName": const PendingTasksScreen(), "title": "Pendings Tasks"},
    {"pageName": const CompletedTasksScreen(), "title": "Completed Tasks"},
    {"pageName": const FavoriteTasksScreen(), "title": "Favorite Tasks"},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent, //fait apparaitre le bord arrondi
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Wrap(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.75,
                    //MediaQuery.of(context).viewInsets.bottom => si clavier est visible, le champ de saisie reste au dessus du clavier
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // color: forDialog ? const Color(0xFF737373) : Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0)),
                    ),
                    child: const EditTaskScreen(),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pageDtetails[_selectedPageIndex]["title"],
          style: Utils3.bodyTextStyleMedium(context: context)
              .copyWith(color: kColorWhite),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Text(
                  "5+",
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
      drawer: const MyDrawer(),
      body: _pageDtetails[_selectedPageIndex]["pageName"],
      floatingActionButton: _selectedPageIndex == 0
          ? CustomFloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: "Add Task",
              icon: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_sharp),
            label: "Pending Task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: "Completed Task",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite Task",
          ),
        ],
      ),
    );
  }
}
