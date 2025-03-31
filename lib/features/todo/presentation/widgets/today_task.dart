import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_assignment6/core/text_constants.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/riverpod/todo_provider.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/widgets/today_list_tile.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final hideCompleted = ref.watch(hideCompletedProvider);

    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);

    var todayTodos = todos
        .where((todo) =>
            DateTime(
                todo.todoDate.year, todo.todoDate.month, todo.todoDate.day) ==
            todayOnly)
        .toList();

    if (hideCompleted) {
      todayTodos = todayTodos.where((todo) => !todo.todoStatus).toList();
    }

    return todayTodos.isEmpty
        ? const Center(
            child: Text(
              TextConstants.noTask,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 30),
            itemCount: todayTodos.length,
            itemBuilder: (context, index) {
              return TodayListTile(todo: todayTodos[index]);
            },
          );
  }
}
