import 'dart:typed_data';

import 'package:mazaya/core/constent/offer_constants.dart';

class OfferModel {
   int? id;
   String catergroy;
   String responsible;
   String goalCategroy;
   String? organization;
   String numberOfCustomer;
   String city;
   String discount;
   String branches;
   DateTime? startDate;
   DateTime? endDate;
   String name;
   String number;
   Uint8List? image;

  OfferModel( {
    this.id,
    required this.catergroy,
    required this.responsible,
    required this.goalCategroy,
    required this.organization,
    required this.numberOfCustomer,
    required this.city,
    required this.discount,
    required this.branches,
    required this.startDate,
    required this.endDate,
    required this.name,
    required this.number,
    required this.image,
  });

  factory OfferModel.fromJson(json) {
    return OfferModel(
      id: json[OfferConstants.id],
      catergroy: json[OfferConstants.categroy],
      goalCategroy: json[OfferConstants.goalCategroy],
      organization: json[OfferConstants.organization],
      numberOfCustomer: json[OfferConstants.numberOfCustomer],
      city: json[OfferConstants.city],
      discount: json[OfferConstants.discount],
      branches: json[OfferConstants.branches],
      startDate: DateTime.parse(json[OfferConstants.startDate]),
      endDate: DateTime.parse(json[OfferConstants.endDate]),
      name: json[OfferConstants.name],
      number: json[OfferConstants.number],
      image: json[OfferConstants.image], responsible: json[OfferConstants.responsible],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      OfferConstants.categroy: catergroy,
      OfferConstants.goalCategroy: goalCategroy,
      OfferConstants.organization: organization,
      OfferConstants.numberOfCustomer: numberOfCustomer,
      OfferConstants.city: city,
      OfferConstants.discount: discount,
      OfferConstants.branches: branches,
      OfferConstants.startDate: startDate.toString(),
      OfferConstants.endDate: endDate.toString(),
      OfferConstants.name: name,
      OfferConstants.number: number,
      OfferConstants.image: image,
      OfferConstants.responsible : responsible
    };
  }
}
