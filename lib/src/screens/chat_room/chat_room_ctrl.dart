import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timepass/src/backend/chats_query.dart';
import 'package:timepass/src/backend/message_query.dart';
import 'package:timepass/src/models/chats_model.dart';
import 'package:timepass/src/models/msg_models.dart';
import 'package:timepass/src/models/users_models.dart';
import 'package:timepass/src/repository/user_repo.dart';
import 'package:timepass/src/utils/constants/constants.dart';

class ChatRoomCtrl extends GetxController {
  UserModel model;
  TextEditingController textCTRL = TextEditingController();
  String chatId = "NOT";
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>> userStream;
  RxBool isLoading = false.obs;
  RxList<MessagesModel> msgList = <MessagesModel>[].obs;

  ChatRoomCtrl({
    required this.model,
  });

  @override
  void onInit() {
    super.onInit();
    checkChatDoc();
    if (chatId != "NOT") chatList();
  }

  Future<void> checkChatDoc() async {
    chatId = await ChatsQuery().checkDoc(id: model.docId);
    logger.w(chatId);
  }

  void chatList() {
    try {
      isLoading(true);
      userStream = MessageQuery().chatList(chatId: chatId).listen((snap) {
        msgList.clear();
        for (int i = 0; i < snap.docs.length; i++) {
          msgList.add(MessagesModel.fromJson(snap.docs[i].data()));
        }
        isLoading(false);
      });
    } on Exception catch (e) {
      logger.e(e.toString());
      isLoading(false);
    }
  }

  Future<void> sendMsg() async {
    if (chatId != "NOT") {
      await send();
    } else {
      await create();
    }
  }

  Future<void> send() async {
    MessagesModel message = MessagesModel(
        sender: userRepo.userId,
        createdAt: Timestamp.now(),
        msg: textCTRL.text,
        msgType: 1,
        status: {model.docId: 0});
    await MessageQuery().sendMsg(chatId: chatId, model: message);
    textCTRL.text = "";
  }

  Future<void> create() async {
    ChatsModel chatsModel = ChatsModel(
        createdAt: Timestamp.now(),
        inboxFor: [model.docId],
        lastMsg: textCTRL.text,
        sender: userRepo.userId,
        unReadFlag: {
          model.docId: true,
        },
        users: [userRepo.userId, model.docId]);
    logger.w(chatsModel.toJson());
    chatId = await ChatsQuery().createChat(model: chatsModel);
    if (chatId != "NOT") {
      await send();
      textCTRL.text = "";
    }
  }
}
