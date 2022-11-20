import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timepass/src/screens/chat_room/chat_room_ctrl.dart';
import 'package:timepass/src/utils/constants/app_colors.dart';
import 'package:timepass/src/utils/constants/constants.dart';
import 'package:timepass/src/utils/widgets/custom_textfield.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({Key? key}) : super(key: key);
  final c = Get.find<ChatRoomCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            tooltip: "Back",
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            ),
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Text(
                c.model.name[0],
                style: context.textTheme.displayMedium!
                    .copyWith(fontSize: 20, color: AppColors.white),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(c.model.name),
                Text(
                  "${c.model.age}, ${c.model.country}",
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: "Menu",
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => ListView.builder(
              itemCount: c.msgList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text(c.msgList[index].msg);
              },
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              hint: "Enter message",
              controller: c.textCTRL,
              postFixIcon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: InkWell(
                  onTap: () async {
                    await c.sendMsg();
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
