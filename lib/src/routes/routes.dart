import 'package:get/get.dart';
import 'package:timepass/src/routes/pages.dart';
import 'package:timepass/src/screens/chat_room/chat_room.dart';
import 'package:timepass/src/screens/chat_room/chat_room_binding.dart';
import 'package:timepass/src/screens/main_screen/main_screen.dart';
import 'package:timepass/src/screens/register/register.dart';

class Pages {
  static List<GetPage> pageList = [
    GetPage(name: Routes.REGISTER, page: () => Register()),
    GetPage(name: Routes.MAIN_SCREEN, page: () => MainScreen()),
    GetPage(name: Routes.CHAT_ROOM, page: () => ChatRoom(),bindings: [ChatRoomBinding()]),
  ];
}
