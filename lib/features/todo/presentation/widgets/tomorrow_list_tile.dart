import 'package:flutter/material.dart';
import 'package:todo_riverpod_assignment6/core/text_style_constants.dart';
import 'package:todo_riverpod_assignment6/core/utils/format_time.dart';
import 'package:todo_riverpod_assignment6/features/todo/data/data_model.dart';

class TomorrowListTile extends StatelessWidget {
  final DataModel todo;

  const TomorrowListTile({required this.todo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 20,
      leading: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
      ),
      title: Text(
        todo.todoTitle,
        style: TextStyleConstants.todayTaskNotComplete,
      ),
      subtitle: Text(
        formatTime(todo.todoTime),
        style: TextStyleConstants.dateTimeNotCompleted,
      ),
    );
  }
}
