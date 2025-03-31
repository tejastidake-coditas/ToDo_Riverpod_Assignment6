import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_assignment6/core/color_constants.dart';
import 'package:todo_riverpod_assignment6/core/text_style_constants.dart';
import 'package:todo_riverpod_assignment6/core/utils/format_time.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/riverpod/todo_provider.dart';

class TimePickerWidget extends ConsumerWidget {
  const TimePickerWidget({super.key});

  void _showCupertinoTimePicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          use24hFormat: true,
          onDateTimeChanged: (DateTime newTime) {
            ref
                .read(selectedTimeProvider.notifier)
                .state =
                TimeOfDay(hour: newTime.hour, minute: newTime.minute);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = ref.watch(selectedTimeProvider);
    final formattedTime = formatTime(selectedTime);

    return Row(
      children: [
        GestureDetector(
          onTap: () => _showCupertinoTimePicker(context, ref),
          child: Container(
            decoration: BoxDecoration(
              color: ColorConstants.boxColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              formattedTime.split(" ")[0], // Extract time part
              style: TextStyleConstants.selectedTimeStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: ColorConstants.boxColor,
                blurRadius: 1,
                spreadRadius: 3,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 8,
                spreadRadius: -4,
              ),
            ],
          ),
          child: Text(
            formattedTime.split(" ")[1], // Extract AM/PM part
            style: TextStyleConstants.selectedTimeStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
