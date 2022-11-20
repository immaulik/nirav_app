import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timepass/src/models/users_models.dart';
import 'package:timepass/src/routes/pages.dart';
import 'package:timepass/src/utils/constants/app_colors.dart';

class UserTile extends StatelessWidget {
  UserTile({Key? key, required this.model}) : super(key: key);
  UserModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.CHAT_ROOM, arguments: model);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.primaryColor,
              child: Text(
                model.name[0],
                style: context.textTheme.displayMedium!
                    .copyWith(fontSize: 25, color: AppColors.white),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              model.name,
              style: context.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
