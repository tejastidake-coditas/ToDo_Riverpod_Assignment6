import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_assignment6/core/color_constants.dart';
import 'package:todo_riverpod_assignment6/core/text_constants.dart';
import 'package:todo_riverpod_assignment6/core/text_style_constants.dart';
import 'package:todo_riverpod_assignment6/core/utils/format_time.dart';
import 'package:todo_riverpod_assignment6/features/todo/data/data_model.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/riverpod/todo_provider.dart';

class TodayListTile extends ConsumerWidget {
  final DataModel todo;

  const TodayListTile({required this.todo, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          ref.read(todoProvider.notifier).toggleTodo(todo.todoId);
        },
        child: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: todo.todoStatus
                ? ColorConstants.checkboxFillColor
                : Colors.white,
            border: Border.all(
              color: todo.todoStatus
                  ? Colors.transparent
                  : ColorConstants.checkboxBorderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: todo.todoStatus
              ? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 18,
                )
              : null,
        ),
      ),
      title: Text(
        todo.todoTitle,
        style: todo.todoStatus
            ? TextStyleConstants.todayTaskComplete
            : TextStyleConstants.todayTaskNotComplete,
      ),
      subtitle: Text(
        formatTime(todo.todoTime),
        style: todo.todoStatus
            ? TextStyleConstants.dateTimeCompleted
            : TextStyleConstants.dateTimeNotCompleted,
      ),
      trailing: !todo.todoStatus
          ? IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                _showDeleteDialog(context, ref, todo.todoId);
              },
            )
          : null,
    );
  }

  void _showDeleteDialog(BuildContext context, WidgetRef ref, int todoId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Icons.warning_amber,
            color: Colors.red,
          ),
          title: Text(TextConstants.deleteDialogTitle),
          content: Text(TextConstants.deleteDialogDesc),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(TextConstants.cancel),
            ),
            TextButton(
              onPressed: () {
                ref.read(todoProvider.notifier).deleteTodo(todoId);
                Navigator.pop(context);
              },
              child: Text(TextConstants.delete),
            ),
          ],
        );
      },
    );
  }
}
