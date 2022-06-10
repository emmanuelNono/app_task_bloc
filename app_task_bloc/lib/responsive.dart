import 'package:app_task_bloc/utils/utils_constant_and_size/size_config.dart';
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
     MediaQuery.of(context).size.width < 1100 && MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      SizeConfig.screenWidth! >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        //si la largeur de l'ecran est supérieur à 1100, alors c'est un desktop
        if (constraints.maxWidth >= 1100) {
          // print("c1 desktop avec ${SizeConfig.screenWidth!}");
          return desktop;
        }
        //sinon si la largeur de l'ecran est supérieur à 650, alors c'est une tablet
        else if (constraints.maxWidth >= 650) {
          // print("c2 tablet avec ${SizeConfig.screenWidth!}");
          return tablet;
        }
        //sinon c'est un mobile
        else {
          // print("c3 mobile avec ${SizeConfig.screenWidth!}");
          return mobile;
        }
      },
    );
  }
}
