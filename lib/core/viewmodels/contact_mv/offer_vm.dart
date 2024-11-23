import 'dart:developer';

import 'package:mazaya/core/models/contact_model.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/helpers/db_helper.dart';

class OfferVm {
  static DbHelper dbObject = DbHelper();

  static add(String tableName, OfferModel c) {
    DbHelper().save(tableName, c.toJson());
  }

  static update(String tableName, OfferModel user) {
    DbHelper().update(tableName, user.toJson(), user.id.toString());
  }

  static Future<List<OfferModel>> get(String table) async {
    List<Map<String, dynamic>> row = await DbHelper().show(table);
    log("${row.length}");
    List<OfferModel> coll = row.map((e) => OfferModel.fromJson(e)).toList();
    return coll;
  }

  static search(String table, int id, title) async {
    List<Map<String, dynamic>> row = await DbHelper().show(table);
    List<ContactModel> coll = row.map((e) => ContactModel.fromJson(e)).toList();
    return coll;
  }
}
