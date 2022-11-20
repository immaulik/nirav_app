import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timepass/src/backend/field_keys.dart';
import 'package:timepass/src/models/chats_model.dart';
import 'package:timepass/src/models/users_models.dart';
import 'package:timepass/src/repository/user_repo.dart';
import 'package:timepass/src/utils/constants/constants.dart';

class ChatsQuery {
  CollectionReference<Map<String, dynamic>> chatsCol =
      FirebaseFirestore.instance.collection(FieldKeys.chats);

  Future<String> createChat({required ChatsModel model}) async {
    try {
      var data = await chatsCol.add(model.toJson());
      logger.i(data.id);
      return data.id;
    } on Exception catch (e) {
      logger.e(e.toString());
      return "NOT";
    }
  }

  Future<String> checkDoc({required String id}) async {
    logger.d("${id}");
    logger.d("${userRepo.userId}");
    var doc = await chatsCol
        .where(
          "users",
          arrayContains: userRepo.userId,
        )
        .get();
    if (doc.docs.isNotEmpty) {
      return doc.docs.first.id;
    } else {
      return "NOT";
    }
  }
}
