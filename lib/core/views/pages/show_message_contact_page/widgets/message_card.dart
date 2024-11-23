import 'package:flutter/material.dart';
import 'package:mazaya/core/models/contact_model.dart';

class MessageCard extends StatelessWidget {
  final ContactModel contact;
  const MessageCard({
    super.key,
    required this.contact,
  });
  final String accept = "رد";
  final String notaccept = "تجاهل";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("تم الرد")));
                      },
                      child: Text(accept)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("تم التجاهل")));
                      },
                      child: Text(notaccept)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("المرسل : ${contact.name}"),
                  Text("الايميل : ${contact.email}"),
                  Text("عنوان الرساله :  ${contact.title}"),
                  Text(" الرساله : ${contact.message}"),
                  Text(
                      " تاريخ الارسال  : ${contact.onCreate.year}/${contact.onCreate.month}/${contact.onCreate.day}"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
