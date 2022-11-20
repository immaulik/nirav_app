import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timepass/src/backend/field_keys.dart';
import 'package:timepass/src/models/msg_models.dart';
import 'package:timepass/src/models/users_models.dart';

class MessageQuery {
  Future<void> sendMsg(
      {required String chatId, required MessagesModel model}) async {
    await FirebaseFirestore.instance
        .collection(FieldKeys.chats)
        .doc(chatId)
        .collection(FieldKeys.messages)
        .add(model.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> chatList(
      {required String chatId}) {
    return FirebaseFirestore.instance
        .collection(FieldKeys.chats)
        .doc(chatId)
        .collection(FieldKeys.messages)
        .orderBy("createdAt", descending: true)
        .snapshots();
  }
}
