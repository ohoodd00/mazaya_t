import 'package:mazaya/core/models/category_model.dart';

class CategoryData {
  static const String image = "assets/image/categroy_image.png";
  static const List<CategoryModel> category = [
    CategoryModel(
        title: "التعليم و المراكز التدريبية",
        subtitle: "نبذة عى المراكز التدريبة و المكتبات",
        image: image),
    CategoryModel(
        title: " الرياضة و العناية و التجميل",
        subtitle: " الرياضة و العناية و التجميل",
        image: image),
    CategoryModel(
        title: "السفر و الفنادق",
        subtitle: "نبذة عن السفر و الفنادق",
        image: image),
    CategoryModel(
        title: "المراكز الطبية و الصيدليات ",
        subtitle: "نبذة عن المراكز الطبية و الصيدليات",
        image: image),
    CategoryModel(
        title: "خدمات السيارات و النقل ",
        subtitle: "كل ما يختص في قطاع السيارات",
        image: image),
    CategoryModel(
        title: "مراكز التسويق و المطاعم",
        subtitle: "كل ما يختص في مراكز التسوق",
        image: image),
  ];
}
