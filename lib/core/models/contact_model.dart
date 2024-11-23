import 'package:mazaya/core/constent/contact_constants.dart';

class ContactModel {
  final int? id;
  final String name;
  final String email;
  final String title;
  final String message;
  final DateTime onCreate;

  ContactModel( 
      {
      this.id,
      required this.name,
      required this.email,
      required this.title,
      required this.message,
      required this.onCreate});

  factory ContactModel.fromJson(json) {
    return ContactModel(
      id : json[Constants.id],
      name: json[Constants.name],
      email: json[Constants.email],
      title: json[Constants.title],
      message: json[Constants.message],
      onCreate: DateTime.parse(json[Constants.date]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Constants.name: name,
      Constants.title: title,
      Constants.email: email,
      Constants.message: message,
      Constants.date: onCreate.toString(),
    };
  }
}
