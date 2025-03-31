import 'package:flutter/material.dart';
import 'package:todo_riverpod_assignment6/core/color_constants.dart';
import 'package:todo_riverpod_assignment6/core/text_constants.dart';
import 'package:todo_riverpod_assignment6/core/text_style_constants.dart';

class BottomSheetTopBar extends StatelessWidget {
  const BottomSheetTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios,
                    color: ColorConstants.blueColor, size: 24),
                Text(
                  TextConstants.close,
                  style: TextStyleConstants.closeStyle,
                ),
              ],
            ),
          ),
        ),
        const Center(
          child: Text(
            TextConstants.task,
            style: TextStyleConstants.taskTitleStyle,
          ),
        ),
      ],
    );
  }
}
