import 'package:flutter/services.dart';
import 'package:mazaya/core/constent/offer_constants.dart';
import 'package:mazaya/core/models/offer_model.dart';
import 'package:mazaya/core/viewmodels/check_notification_vm/check_notification_vm.dart';
import 'package:mazaya/core/viewmodels/contact_mv/offer_vm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeData {
  static bool justcheck = false;
  static String justcheck2 = "value1";
  static List<OfferModel> fakeOffer = [];
  static String? check;

  static Future<Uint8List> convert(String image) async {
    final ByteData bytes = await rootBundle.load(image);
    final Uint8List list = bytes.buffer.asUint8List();
    return list;
  }

  Future<void> checkFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstRun = prefs.getBool('isFirstRun') ?? true;
    await Future.delayed(const Duration(seconds: 0), () async {});
    if (isFirstRun) {
      justcheck2 = "value2";
      // justcheck2 = 'value2';
      // await CheckNotificationVm.userLogin(value: justcheck2);
      // Run your function here
      _runOnFirstRun();

      // Set the flag to false so it doesn't run again
      await prefs.setBool('isFirstRun', false);
    }
    await CheckNotificationVm().add(OfferConstants.lengthNewTable, justcheck2);
    await CheckNotificationVm.getNubmer(OfferConstants.lengthNewTable);
    await CheckNotificationVm.userLogin(value: justcheck2);
  }

  void _runOnFirstRun() async {
    fakeOffer = await fun();
    for (var element in fakeOffer) {
      OfferVm.add(OfferConstants.tableName, element);
    }
  }

  static Future<List<OfferModel>> fun() async {
    DateTime now = DateTime.now();
    return fakeOffer = [
      OfferModel(
        responsible: "مدارس تربية الابناء الاةلية",
        catergroy: "التعليم و المراكز التدريبية",
        goalCategroy: "الطلاب",
        organization: "خاصة",
        numberOfCustomer: "5559",
        city: "جدة",
        discount: "20",
        branches: "معاهد",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "5454634654",
        image: await convert(
            "assets/local_offer_image/img_rectangle_22_46x146.png"),
      ),
      OfferModel(
        responsible: "معهد المصفوفة الفضة العالي للتدريب",
        catergroy: "التعليم و المراكز التدريبية",
        goalCategroy: "الطلاب",
        organization: "خاصة",
        numberOfCustomer: "1589",
        city: "المدينة",
        discount: "25",
        branches: "معاهد",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "515468468",
        image: await convert(
            "assets/local_offer_image/img_rectangle_22_46x140.png"),
      ),
      OfferModel(
        responsible: "معهد وول استريت انجلش (كونسلتكس المتحدة للتدريب)",
        catergroy: "التعليم و المراكز التدريبية",
        goalCategroy: "الطلاب",
        organization: "خاصة",
        numberOfCustomer: "5412",
        city: "الرياض",
        discount: "30",
        branches: "معاهد",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "35456468",
        image: await convert("assets/local_offer_image/img_rectangle_22_1.png"),
      ),
      OfferModel(
        responsible: "معهد الخوارزمي",
        catergroy: "التعليم و المراكز التدريبية",
        goalCategroy: "الطلاب",
        organization: "خاصة",
        numberOfCustomer: "5559",
        city: "جدة",
        discount: "15",
        branches: "معاهد",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "65468464",
        image: await convert(
            "assets/local_offer_image/img_rectangle_22_46x128.png"),
      ),
      OfferModel(
        responsible: "مركز و معهد بواسق للتدريب",
        catergroy: "التعليم و المراكز التدريبية",
        goalCategroy: "الطلاب",
        organization: "خاصة",
        numberOfCustomer: "1548",
        city: "جدة",
        discount: "20",
        branches: "معاهد",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "454684333",
        image: await convert("assets/local_offer_image/img_rectangle_22_2.png"),
      ),
      OfferModel(
        responsible: "معهد الدراسات الحديثة ",
        catergroy: "التعليم و المراكز التدريبية",
        goalCategroy: "الطلاب",
        organization: "حكومية",
        numberOfCustomer: "1545",
        city: "جدة",
        discount: "10",
        branches: "معاهد",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "644354684",
        image: await convert(
            "assets/local_offer_image/img_rectangle_22_48x144.png"),
      ),
      OfferModel(
        responsible: "مركز روح النسائي",
        catergroy: " الرياضة و العناية و التجميل",
        goalCategroy: "النساء",
        organization: "خاصة",
        numberOfCustomer: "5463",
        city: "جدة",
        discount: "60",
        branches: "نادي",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "35416464",
        image: await convert("assets/local_offer_image/women.jpeg"),
      ),
      OfferModel(
        responsible: "مركز روح الرجالي",
        catergroy: " الرياضة و العناية و التجميل",
        goalCategroy: "الرجال",
        organization: "خاصة",
        numberOfCustomer: "1655",
        city: "جدة",
        discount: "60",
        branches: "نادي",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "35486468",
        image: await convert("assets/local_offer_image/man.jpeg"),
      ),
      OfferModel(
        responsible: "فندق المدينة",
        catergroy: "السفر و الفنادق",
        goalCategroy: "الطلاب",
        organization: "خاصة",
        numberOfCustomer: "5489",
        city: "جدة",
        discount: "20",
        branches: "فنادق",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "54687461",
        image: await convert("assets/local_offer_image/hotel1.jpeg"),
      ),
      OfferModel(
        responsible: "فندق جاردن سيتي",
        catergroy: "السفر و الفنادق",
        goalCategroy: "الطلاب",
        organization: "خاصة",
        numberOfCustomer: "5489",
        city: "جدة",
        discount: "20",
        branches: "فنادق",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "778870086",
        image: await convert("assets/local_offer_image/hotal2.jpeg"),
      ),
      OfferModel(
        responsible: "فندق البرطاني",
        catergroy: "السفر و الفنادق",
        goalCategroy: "الطلاب",
        organization: "خاصة",
        numberOfCustomer: "5489",
        city: "جدة",
        discount: "20",
        branches: "فنادق",
        startDate: DateTime(now.year, now.month + 2, now.day),
        endDate: DateTime(now.year, now.month + 2, now.day),
        name: "اسامة",
        number: "3544656416",
        image: await convert("assets/local_offer_image/hotel3.jpeg"),
      ),
    ];
  }
}
