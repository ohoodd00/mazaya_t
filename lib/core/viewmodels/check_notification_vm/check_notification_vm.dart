import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:mazaya/core/constent/offer_constants.dart';
import 'package:mazaya/core/services/notification_services.dart';
import 'package:mazaya/core/viewmodels/user_viewmodel/user_vm.dart';
import 'package:mazaya/helpers/db_helper.dart';

class Number {
  final String i;

  Number({required this.i});
  factory Number.fromJson(json) {
    return Number(i: json["length"]);
  }
}

class CheckNotificationVm {
  static int i = 0;

  static bool isDateDone(DateTime date) {
    DateTime now = DateTime.now();
    return date.isBefore(now); // Returns true if date is in the past
  }

  static Future<int> getTable(String table) async {
    List<Map<String, dynamic>> row = await DbHelper().show(table);
    for (var element in row) {
      if (!isDateDone(DateTime.parse(element[OfferConstants.endDate]))) {
        i = row.length;
      }
    }
    log(i.toString());

    return i;
  }

  static Future<void> getNubmer(String table) async {
    int newLengthTable = await getTable(OfferConstants.newtableName);

    List<Map<String, dynamic>> row = await DbHelper().show(table);
    List<Number> coll = row.map((e) => Number.fromJson(e)).toList();
    if (0 != newLengthTable &&
        coll[1].i == "value1" &&
        UserVm.userRead() != "admin1" &&
        UserVm.userRead() != "admin2") {
      await NotificationServices().showNotification(
          title: "عروض جديدة 😍", body: " يوجد عروض مميزة و حصرية");
    }
  }

  static final GetStorage _box = GetStorage();
  static userLogin({required String value}) {
    _box.write("value", value);
  }

  static String? userRead() {
    String? value = _box.read("value");
    return value;
  }

  add(String tableName, String item) async {
    DbHelper().save(tableName, {"length": item});
  }
}
