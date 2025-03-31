import 'package:flutter/material.dart';
import 'package:todo_riverpod_assignment6/core/color_constants.dart';

class TextStyleConstants {
  static const TextStyle mainHeading = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 38,
    letterSpacing: 0.37,
    height: 41 / 34,
  );

  static const TextStyle note = TextStyle(
    color: ColorConstants.noteText,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static const TextStyle hideCompleted = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color(0xe53478f6),
  );

  static const TextStyle todayTaskNotComplete = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: Color(0xff737373),
    letterSpacing: -0.14,
    height: 20 / 15,
  );

  static const TextStyle todayTaskComplete = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: Color.fromRGBO(115, 115, 115, 0.203),
    letterSpacing: -0.14,
    height: 20 / 15,
    decoration: TextDecoration.lineThrough,
    decorationColor: Color.fromRGBO(115, 115, 115, 0.203),
    decorationThickness: 2,
  );

  static const TextStyle dateTimeNotCompleted = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color(0xffA3A3A3),
    letterSpacing: -0.14,
    height: 18 / 13,
  );

  static const TextStyle dateTimeCompleted = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: Color.fromRGBO(115, 115, 115, 0.172),
    letterSpacing: -0.14,
    height: 18 / 13,
    decoration: TextDecoration.lineThrough,
    decorationColor: Color.fromRGBO(115, 115, 115, 0.172),
    decorationThickness: 2,
  );

  static const TextStyle taskTitleStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: ColorConstants.blackColor);

  static const TextStyle backBottomSheetText = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
    letterSpacing: -0.41,
    height: 22 / 17,
    color: ColorConstants.blueColor,
  );

  static const TextStyle taskBottomBarTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle closeStyle = TextStyle(
    color: ColorConstants.blueColor,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle textFieldStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle selectedTimeStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle addTask = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.w700,
  );
}
