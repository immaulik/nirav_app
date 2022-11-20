import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timepass/src/backend/field_keys.dart';
import 'package:timepass/src/models/users_models.dart';
import 'package:timepass/src/repository/user_repo.dart';
import 'package:timepass/src/utils/constants/constants.dart';

class UsersQuery {
  CollectionReference<Map<String, dynamic>> usersCol =
      FirebaseFirestore.instance.collection(FieldKeys.users);

  Future<void> createUser({required UserModel userModel}) async {
    try {
      var data = await usersCol.add(userModel.toJson());
      await usersCol.doc(data.id).update({"docId": data.id});
      userRepo.userId = data.id;
      userRepo.model(userModel);
    } on Exception catch (e) {
      logger.e(e.toString());
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllUser() {
    return usersCol.where("docId", isNotEqualTo: userRepo.userId).snapshots();
  }
}
