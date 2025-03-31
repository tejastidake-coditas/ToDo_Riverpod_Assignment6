import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_assignment6/core/color_constants.dart';
import 'package:todo_riverpod_assignment6/core/text_constants.dart';
import 'package:todo_riverpod_assignment6/core/text_style_constants.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/riverpod/todo_provider.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/widgets/appbar_widget.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/widgets/bottom_sheet.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/widgets/today_task.dart';
import 'package:todo_riverpod_assignment6/features/todo/presentation/widgets/tomorrow_task.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideCompleted = ref.watch(hideCompletedProvider);

    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    TextConstants.todayText,
                    style: TextStyleConstants.mainHeading,
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(hideCompletedProvider.notifier).state =
                          !hideCompleted;
                    },
                    child: Text(
                      hideCompleted
                          ? TextConstants.showCompleted
                          : TextConstants.hideCompleted,
                      style: TextStyleConstants.hideCompleted,
                    ),
                  ),
                ],
              ),
              const TodayTask(),
              const SizedBox(height: 6),
              Text(
                TextConstants.tomorrowText,
                style: TextStyleConstants.mainHeading,
              ),
              const TomorrowTask(),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 42,
        height: 42,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: ColorConstants.backgroundColor,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              builder: (BuildContext context) {
                return const BottomSheetWidget();
              },
            );
          },
          backgroundColor: ColorConstants.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
          child: Icon(
            Icons.add,
            color: ColorConstants.whiteColor,
            size: 32,
          ),
        ),
      ),
    );
  }
}
