import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timepass/src/screens/home/home_ctrl.dart';
import 'package:timepass/src/utils/widgets/user_tile.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final c = Get.put(HomeCtrl());
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return UserTile(model: c.userList[index]);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: c.userList.length);
  }
}
