import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_assignment6/core/color_constants.dart';
import 'package:todo_riverpod_assignment6/core/text_constants.dart';
import 'package:todo_riverpod_assignment6/core/text_style_constants.dart';
import 'package:todo_riverpod_assignment6/features/todo/data/data_model.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/riverpod/todo_provider.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/widgets/bottom_sheet_top_bar.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/widgets/time_widget.dart';

class BottomSheetWidget extends ConsumerStatefulWidget {
  const BottomSheetWidget({super.key});

  @override
  ConsumerState<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends ConsumerState<BottomSheetWidget> {
  final TextEditingController _titleController = TextEditingController();

  void _addTodo() {
    final String title = _titleController.text.trim();
    final selectedTime = ref.read(selectedTimeProvider);
    final isToday = ref.read(isTodayProvider);

    if (title.isNotEmpty) {
      final newTodo = DataModel(
        todoId: DateTime.now().millisecondsSinceEpoch,
        todoTitle: title,
        todoDate: DateTime.now()
            .add(isToday ? Duration.zero : const Duration(days: 1)),
        todoTime: selectedTime,
        isItToday: isToday,
      );

      ref.read(todoProvider.notifier).addTodo(newTodo);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isToday = ref.watch(isTodayProvider);

    return Container(
      height: MediaQuery.of(context).size.height * 0.95,
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 16),
            child: const BottomSheetTopBar(),
          ),
          Divider(thickness: 1, height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TextConstants.addTaskText,
                    style: TextStyleConstants.addTask),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(TextConstants.name,
                        style: TextStyleConstants.taskBottomBarTitle),
                    const SizedBox(width: 17),
                    Expanded(
                      child: TextField(
                        controller: _titleController,
                        style: TextStyleConstants.textFieldStyle,
                        decoration: InputDecoration(
                          hintText: TextConstants.enterTaskName,
                          hintStyle: TextStyle(color: ColorConstants.noteText),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: ColorConstants.borderSideColor)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: ColorConstants.blackColor)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(TextConstants.hour,
                        style: TextStyleConstants.taskBottomBarTitle),
                    const SizedBox(width: 26),
                    TimePickerWidget()
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(TextConstants.today,
                        style: TextStyleConstants.taskBottomBarTitle),
                    Switch(
                      value: isToday,
                      thumbColor:
                          WidgetStateProperty.all(ColorConstants.whiteColor),
                      activeTrackColor: ColorConstants.switchActiveColor,
                      onChanged: (value) {
                        ref.read(isTodayProvider.notifier).state = value;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _addTodo,
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11)),
                        backgroundColor: ColorConstants.doneButtonBackground,
                        foregroundColor: ColorConstants.doneButtonForeground),
                    child: Text(TextConstants.done),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    TextConstants.note,
                    style: TextStyleConstants.note,
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }
}
