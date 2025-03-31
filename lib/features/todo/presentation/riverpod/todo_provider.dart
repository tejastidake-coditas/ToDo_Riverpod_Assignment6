import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_assignment6/features/todo/data/data_model.dart';

final todoProvider =
    StateNotifierProvider<TodoNotifier, List<DataModel>>((ref) {
  return TodoNotifier();
});

final showCompletedProvider = StateProvider<bool>((ref) => true);
final hideCompletedProvider = StateProvider<bool>((ref) => false);
final isTodayProvider = StateProvider<bool>((ref) => true);
final selectedTimeProvider = StateProvider<TimeOfDay>((ref) => TimeOfDay.now());

class TodoNotifier extends StateNotifier<List<DataModel>> {
  TodoNotifier() : super([]);

  void addTodo(DataModel todo) {
    state = [...state, todo];
  }

  void toggleTodo(int id) {
    state = state
        .map((todo) => todo.todoId == id
            ? todo.copyWith(todoStatus: !todo.todoStatus)
            : todo)
        .toList();
  }

  void deleteTodo(int todoId) {
    state = state.where((todo) => todo.todoId != todoId).toList();
  }
}
