import 'package:flutter/material.dart';

import '../../responsive.dart';
import '../../utils/utils_constant_and_size/constants.dart';
import '../../utils/utils_date_and_number_and_others/utils3.dart';

class CustomButton extends StatelessWidget {
  final dynamic onClicked;
  final String text;
  final Color? backColor;
  final Color? textFontColor;
  final Size? sizes;
  final bool isArrondi;

  const CustomButton({
    Key? key,
    required this.onClicked,
    required this.text,
    this.backColor,
    this.textFontColor,
    this.sizes,
    required this.isArrondi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: sizes?.width ?? 90.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: isArrondi ? const StadiumBorder() : null,
            minimumSize: const Size.fromHeight(40.0),
            fixedSize: sizes ??
                (Responsive.isMobile(context)
                    ? const Size(90, 40)
                    : Responsive.isTablet(context)
                        ? const Size(150, 50)
                        : const Size(150, 50)),
            primary: backColor ??
                Theme.of(context)
                    .appBarTheme
                    .backgroundColor, // background color
            shadowColor: kColorBlueClear.withOpacity(0.5),
            elevation: defaultSize * 0.5,
            side: const BorderSide(
              color: kColorLight,
              width: defaultSize * 0.1,
            ),
          ),
          onPressed: onClicked,
          child: Text(
            text,
            style: Utils3.bodyTextStyleMedium(
                context: context, textColor: textFontColor),
          ),
        ),
      );
}
