import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/constent/contact_constants.dart';
import 'package:mazaya/core/viewmodels/contact_mv/contact_vm.dart';
import 'package:mazaya/core/viewmodels/cubit/delete_contact_cubit/delete_contact_cubit.dart';
import 'package:mazaya/core/viewmodels/cubit/delete_contact_cubit/delete_contact_state.dart';
import 'package:mazaya/core/views/pages/show_message_contact_page/widgets/message_card.dart';
import 'package:mazaya/core/views/pages/show_message_contact_page/widgets/show_dailog.dart';

class ShowMessageFutureBuilderWidget extends StatelessWidget {
  const ShowMessageFutureBuilderWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => DeleteContactCubit(),
      child: BlocBuilder<DeleteContactCubit, DeleteContactState>(
        builder: (ctx, state) {
          return FutureBuilder(
              future: ContactVm.get(Constants.tableName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.81,
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: GestureDetector(
                                    onLongPress: () {
                                      ShowDailog.showAlertDialog(
                                          ctx,
                                          snapshot.data![index].id!,
                                          snapshot.data![index],
                                          context,
                                          Constants.tableName);
                                    },
                                    child: MessageCard(
                                      contact: snapshot.data![index],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0),
                        child: FittedBox(
                            child: Text(
                          "لايوجد رسائل",
                          style: TextStyle(
                              fontSize: 1500,
                              color: Colors.white,
                              fontFamily: '',
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                } else {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0),
                      child: FittedBox(
                          child: Text(
                        "لايوجد رسائل",
                        style: TextStyle(
                            fontSize: 1500,
                            color: Colors.white,
                            fontFamily: '',
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                }
              });
        },
      ),
    );
  }
}
