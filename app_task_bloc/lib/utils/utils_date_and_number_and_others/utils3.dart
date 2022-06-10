import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../utils_constant_and_size/constants.dart';

//*********************************************************************************** */

//************        begin FinaleResults Style functions         ****************** */

//*********************************************************************************** */
//others fucntions
class Utils3 {
  static TextStyle bodyTextStyleLarge({
    required BuildContext context,
    bool isbold = false,
    Color? textColor,
    bool isItalic = false,
    bool isUnderline = false,
  }) {
    if (Responsive.isMobile(context)) {
      return Theme.of(context).textTheme.headline4!.copyWith(
            fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
            color: textColor ?? Theme.of(context).primaryColor,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            decoration:
                isUnderline ? TextDecoration.underline : TextDecoration.none,
          );
    } else {
      if (Responsive.isTablet(context)) {
        return Theme.of(context).textTheme.headline3!.copyWith(
              fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
              color: textColor ?? Theme.of(context).primaryColor,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none,
            );
      } else {
        return Theme.of(context).textTheme.headline3!.copyWith(
              fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
              color: textColor ?? Theme.of(context).primaryColor,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none,
            );
      }
    }
  }

  static TextStyle bodyTextStyleMedium({
    required BuildContext context,
    bool isbold = false,
    Color? textColor,
    bool isItalic = false,
    bool isUnderline = false,
  }) {
    if (Responsive.isMobile(context)) {
      return Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
            color: textColor ?? Theme.of(context).primaryColor,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            decoration:
                isUnderline ? TextDecoration.underline : TextDecoration.none,
          );
    } else {
      if (Responsive.isTablet(context)) {
        return Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
              color: textColor ?? Theme.of(context).primaryColor,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none,
            );
      } else {
        return Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
              color: textColor ?? Theme.of(context).primaryColor,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none,
            );
      }
    }
  }

  static TextStyle bodyTextStyleSmall({
    required BuildContext context,
    bool isbold = false,
    Color? textColor,
    bool isItalic = false,
    bool isUnderline = false,
  }) {
    if (Responsive.isMobile(context)) {
      return Theme.of(context).textTheme.headline6!.copyWith(
            fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
            color: textColor ?? Theme.of(context).primaryColor,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            decoration:
                isUnderline ? TextDecoration.underline : TextDecoration.none,
          );
    } else {
      if (Responsive.isTablet(context)) {
        return Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
              color: textColor ?? Theme.of(context).primaryColor,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none,
            );
      } else {
        return Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
              color: textColor ?? Theme.of(context).primaryColor,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              decoration:
                  isUnderline ? TextDecoration.underline : TextDecoration.none,
            );
      }
    }
  }

  static TextStyle titleTextStyle({
    required BuildContext context,
    bool isbold = false, //parametre optionnel avec valeur par defaut
  }) {
    if (Responsive.isMobile(context)) {
      return isbold
          ? Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontWeight: FontWeight.bold)
          : Theme.of(context).textTheme.headline3!;
    } else {
      if (Responsive.isTablet(context)) {
        return isbold
            ? Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.bold)
            : Theme.of(context).textTheme.headline2!;
      } else {
        return isbold
            ? Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontWeight: FontWeight.bold)
            : Theme.of(context).textTheme.headline1!;
      }
    }
  }

  static double customIconSize({
    required BuildContext context,
  }) {
    if (Responsive.isMobile(context)) {
      return defaultSize * 1;
    } else {
      if (Responsive.isTablet(context)) {
        return defaultSize * 1.25;
      } else {
        return defaultSize * 1.5;
      }
    }
  }
}
