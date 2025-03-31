import 'package:flutter/material.dart';

class DataModel {
  final int todoId;
  final String todoTitle;
  bool todoStatus;
  bool isItToday;
  final DateTime todoDate;
  final TimeOfDay todoTime;

  DataModel({
    required this.todoId,
    required this.todoTitle,
    required this.todoDate,
    required this.todoTime,
    this.todoStatus = false,
    this.isItToday = true,
  });

  DataModel copyWith({bool? todoStatus, bool? isItToday}) {
    return DataModel(
      todoId: todoId,
      todoTitle: todoTitle,
      todoDate: todoDate,
      todoTime: todoTime,
      todoStatus: todoStatus ?? this.todoStatus,
      isItToday: isItToday ?? this.isItToday,
    );
  }
}
