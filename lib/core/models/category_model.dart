import 'package:mazaya/core/models/offer_model.dart';

class CategoryModel {
  final String title, subtitle, image;
  final List<OfferModel>? offer;

  const CategoryModel({
    required this.title,
    required this.subtitle,
    required this.image,
    this.offer,
  });
}
