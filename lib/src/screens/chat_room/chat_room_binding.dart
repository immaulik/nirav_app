import 'package:get/get.dart';
import 'package:timepass/src/models/users_models.dart';
import 'package:timepass/src/screens/chat_room/chat_room_ctrl.dart';

class ChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    if (Get.arguments != null) {
      UserModel model = Get.arguments;
      Get.lazyPut(() => ChatRoomCtrl(model: model));
    }
    return null;
  }
}
