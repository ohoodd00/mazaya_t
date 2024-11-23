import 'package:get_storage/get_storage.dart';
import 'package:mazaya/core/models/user_model.dart';
import 'package:mazaya/helpers/db_helper.dart';

class UserVm {
  static final GetStorage _box = GetStorage();

  static userLogin({required String userName, required String password}) {
    _box.write("userName", userName);
    _box.write("password", password);
  }

  static add(String tableName, UserModel c) async {
    DbHelper().save(tableName, c.toJson());
  }

  static Future<List<UserModel>> get(String table) async {
    List<Map<String, dynamic>> row = await DbHelper().show(table);
    List<UserModel> coll = row.map((e) => UserModel.fromJson(e)).toList();
    return coll;
  }

  static update(String tableName, UserModel user) {
    DbHelper().update(tableName, user.toJson(), user.id.toString());
  }

  static String? userRead() {
    String? userName = _box.read("userName");
    return userName;
  }

  static userLogout() {
    _box.remove("userName");
    _box.remove("password");
  }
}
