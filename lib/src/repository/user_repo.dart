import 'package:get/get.dart';
import 'package:timepass/src/models/users_models.dart';

var userRepo = Get.put(UserRepo(), permanent: true);

class UserRepo extends GetxController {
  Rx<UserModel> model = UserModel().obs;

  String userId = "";
}
