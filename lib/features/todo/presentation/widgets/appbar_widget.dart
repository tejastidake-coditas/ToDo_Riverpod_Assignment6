import 'package:flutter/material.dart';
import 'package:todo_riverpod_assignment6/core/text_constants.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      actions: [
        ClipOval(
          child: SizedBox(
            width: 42,
            height: 42,
            child: Image.network(
              TextConstants.profileImageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 14),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
