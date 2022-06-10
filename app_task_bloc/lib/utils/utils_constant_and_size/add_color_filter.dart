import 'package:flutter/material.dart';

// Our design contains Neumorphism design and i made a extention for it
// We can apply it on any  widget

class ColorFilters {
  static const greyscale = ColorFilter.matrix(<double>[
    //greyscale filter
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0, 0, 0, 1, 0
  ]);
}
