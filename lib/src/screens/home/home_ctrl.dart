import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:timepass/src/backend/users_query.dart';
import 'package:timepass/src/models/users_models.dart';
import 'package:timepass/src/repository/user_repo.dart';
import 'package:timepass/src/utils/constants/constants.dart';

class HomeCtrl extends GetxController {
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>> userStream;
  RxBool isLoading = false.obs;
  RxList<UserModel> userList = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllOffers();
  }

  Future<void> getAllOffers() async {
    try {
      isLoading(true);
      userStream = UsersQuery().getAllUser().listen((snap) async {
        userList.clear();
        for (int i = 0; i < snap.docs.length; i++) {
          userList.add(UserModel.fromJson(snap.docs[i].data()));
        }
        isLoading(false);
      });
    } on Exception catch (e) {
      logger.e(e.toString());
      isLoading(false);
    }
  }

  @override
  void onClose() {
    userStream.cancel();
    super.onClose();
  }
}
