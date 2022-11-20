import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timepass/src/models/users_models.dart';
import 'package:timepass/src/routes/pages.dart';
import 'package:timepass/src/screens/home/home.dart';
import 'package:timepass/src/screens/inbox_screen/inbox_screen.dart';
import 'package:timepass/src/screens/main_screen/main_screen_ctrl.dart';
import 'package:timepass/src/screens/older_chat/older_chat.dart';
import 'package:timepass/src/screens/older_chat/older_chat_ctrl.dart';
import 'package:timepass/src/utils/constants/app_colors.dart';
import 'package:timepass/src/utils/widgets/user_tile.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final c = Get.put(MainScreenCtrl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  tooltip: "Inbox",
                  onPressed: () {
                    Get.delete<OlderChatCtrl>();
                    c.selectedIndex(2);
                  },
                  icon: Icon(
                    Icons.mark_email_unread,
                  ),
                ),
                IconButton(
                  tooltip: "Chats",
                  onPressed: () {
                    c.selectedIndex(3);
                  },
                  icon: Icon(
                    Icons.mail,
                  ),
                ),
                IconButton(
                  tooltip: "Home",
                  onPressed: () {
                    Get.delete<OlderChatCtrl>();
                    c.selectedIndex(1);
                  },
                  icon: Icon(
                    Icons.home,
                  ),
                ),
                Spacer(),
                IconButton(
                  tooltip: "Menu",
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                  ),
                ),
              ],
            ),
            Expanded(child: Obx(() => screen())),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    tooltip: "search",
                    onPressed: () {
                      c.selectedIndex(1);
                    },
                    icon: Icon(
                      Icons.search,
                    ),
                  ),
                  IconButton(
                    tooltip: "Logo",
                    onPressed: null,
                    icon: Icon(
                      Icons.diamond,
                      color: AppColors.black,
                    ),
                  ),
                  IconButton(
                    tooltip: "Logout",
                    onPressed: () {
                      c.selectedIndex(1);
                    },
                    icon: Icon(
                      Icons.logout,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget screen() {
    switch (c.selectedIndex.value) {
      case 1:
        return Home();
      case 2:
        return InboxScreen();
      default:
        return OlderChat();
    }
  }
}
