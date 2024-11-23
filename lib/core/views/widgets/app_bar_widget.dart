import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mazaya/core/viewmodels/cubit/menu_cubit/menu_cubit_cubit.dart';

class AppbarWidget extends StatefulWidget {
  const AppbarWidget({
    super.key,
    this.checkMenuPage,
  });
  final bool? checkMenuPage;

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  static bool? showMenu;
  @override
  void initState() {
    showMenu = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              widget.checkMenuPage == null || showMenu!
                  ? BlocProvider.of<MenuCubitCubit>(context)
                      .showMenu(show: showMenu!)
                  : Navigator.pop(context);
              showMenu = !showMenu!;
            },
            icon: const Icon(
              Icons.menu,
              size: 45,
              color: Colors.white,
            ),
          ),
          SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.13,
              child: Image.asset("assets/image/logo.png"))
        ],
      ),
    );
  }
}
