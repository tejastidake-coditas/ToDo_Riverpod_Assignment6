import 'package:flutter/material.dart';

String formatTime(TimeOfDay time) {
  final hour = time.hour > 12
      ? time.hour - 12
      : (time.hour == 0 ? 12 : time.hour);
  final period = time.hour >= 12 ? "PM" : "AM";
  return "$hour:${time.minute.toString().padLeft(2, '0')} $period";
}
