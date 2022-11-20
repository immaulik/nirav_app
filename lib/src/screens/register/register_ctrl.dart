import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:timepass/src/backend/users_query.dart';
import 'package:timepass/src/models/users_models.dart';
import 'package:timepass/src/routes/pages.dart';
import 'package:timepass/src/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class RegisterCtrl extends GetxController {
  TextEditingController nameCTRL = TextEditingController();
  TextEditingController ageCTRL = TextEditingController();
  TextEditingController countryCTRL = TextEditingController();
  RxInt selectGender = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCountry();
  }

  Future<void> createAccount() async {
    try {
      isLoading(true);
      UserModel model = UserModel(
          gender: selectGender(),
          name: nameCTRL.text,
          createdAt: Timestamp.now(),
          age: int.parse(ageCTRL.text),
          country: countryCTRL.text);
      UsersQuery().createUser(userModel: model);
      Get.offAndToNamed(Routes.MAIN_SCREEN);
      isLoading(false);
    } on Exception catch (e) {
      isLoading(false);
      logger.e(e.toString());
    }
  }

  Future<void> getCountry() async {
    try {
      http.get(Uri.parse('http://ip-api.com/json')).then((value) {
        countryCTRL.text = jsonDecode(value.body)['country'].toString();
      });
    } catch (err) {
      logger.e(err);
    }
  }
}
