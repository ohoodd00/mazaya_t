import 'dart:developer';

import 'package:mazaya/core/models/contact_model.dart';
import 'package:mazaya/helpers/db_helper.dart';

class ContactVm {
  static DbHelper dbObject = DbHelper();

  static add(String tableName, ContactModel c) async {
    DbHelper().save(tableName, c.toJson());
  }

  static Future<List<ContactModel>> get(String table) async {
    List<Map<String, dynamic>> row = await DbHelper().show(table);
    log("$row");
    List<ContactModel> coll = row.map((e) => ContactModel.fromJson(e)).toList();
    return coll;
  }

  static search(String table, int id, title) async {
    List<Map<String, dynamic>> row = await DbHelper().show(table);
    List<ContactModel> coll = row.map((e) => ContactModel.fromJson(e)).toList();
    return coll;
  }
}
