import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_assignment6/core/text_constants.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/riverpod/todo_provider.dart';
import 'package:todo_riverpod_assignment6/features/todo/data/data_model.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/widgets/tomorrow_list_tile.dart';

class TomorrowTask extends ConsumerWidget {
  const TomorrowTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    if (todos.isEmpty) {
      return const Center(child: Text(TextConstants.noTomorrowTask));
    }

    final tomorrowTodos = todos.where((todo) => !todo.isItToday).toList();

    return tomorrowTodos.isEmpty
        ? const Center(child: Text(TextConstants.noTomorrowTask))
        : ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 34),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: tomorrowTodos.length,
            itemBuilder: (context, index) {
              final DataModel todo = tomorrowTodos[index];
              return TomorrowListTile(todo: todo);
            },
          );
  }
}
