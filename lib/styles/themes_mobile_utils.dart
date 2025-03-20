import 'package:flutter/material.dart';

const unselectedColorLightMode = Colors.black54;
const unselectedColorDarkMode = Colors.grey;
const backgroundColor = Color(0xFFFAFAFA);

WidgetStateProperty<TextStyle?>? labelTextStyleLightMode(Color color) =>
    WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: color,
            letterSpacing: 1,
            overflow: TextOverflow.ellipsis,
          );
        }
        return const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: unselectedColorLightMode,
          letterSpacing: 1,
          overflow: TextOverflow.ellipsis,
        );
      },
    );

WidgetStateProperty<TextStyle?>? labelTextStyleDarkMode(Color color) =>
    WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: color,
            letterSpacing: 1,
            overflow: TextOverflow.ellipsis,
          );
        }
        return const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: unselectedColorDarkMode,
          letterSpacing: 1,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
