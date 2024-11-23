import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/constent/contact_constants.dart';
import 'package:mazaya/core/models/contact_model.dart';
import 'package:mazaya/core/viewmodels/cubit/delete_contact_cubit/delete_contact_cubit.dart';
import 'package:mazaya/helpers/db_helper.dart';

class ShowDailog {
  static showAlertDialog(BuildContext ctx,
      int index, ContactModel contact, BuildContext context, String tableName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog Title'),
          content: const Text('This is the content of the alert dialog.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                DbHelper().delete(Constants.tableName, index);
                BlocProvider.of<DeleteContactCubit>(ctx).stateDelete(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
