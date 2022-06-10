import 'package:flutter/material.dart';

import '../../utils/utils_constant_and_size/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool? focusText;
  final int? minLines;
  final int? maxLines;
  // final TextInputType textInputType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.labelText,
    this.focusText,
    this.minLines,
    this.maxLines,

    // required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        style: const TextStyle(
          color: kColorDarkGrey,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        autofocus: focusText ?? false,
        minLines: minLines,
        maxLines: maxLines,
        decoration: InputDecoration(
          label: labelText == null ? null : Text('$labelText'),
          filled: true,
          fillColor: const Color(0xffF5F6FA),
          hintText: hintText,
          hintStyle: TextStyle(color: kColorDarkGrey.withOpacity(0.4)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: controller!.text.isEmpty
              ? Container(width: 0)
              : IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => controller!.clear(),
                ),
        ),
      );
}
