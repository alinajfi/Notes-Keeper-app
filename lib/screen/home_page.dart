// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_version_2/components/my_action_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime now = DateTime.now();
  Random random = Random();
  late Size size;
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: firstRow()),
                Expanded(flex: 1, child: secondRow()),
              ],
            ),
          ),
        ),
        floatingActionButton: buildFAB(),
      ),
    );
  }

  Widget firstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'Notes Keeper',
            style: myTextStyle(),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyActionButton(
                  onTap: () {},
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  )),
              MyActionButton(
                  onTap: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget secondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'My Notes',
            style: TextStyle(color: Colors.white, fontSize: height * 0.03),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyActionButton(
                  onTap: () {},
                  icon: const Icon(
                    Icons.list_outlined,
                    color: Colors.white,
                  )),
              MyActionButton(
                  onTap: () {},
                  icon: const Icon(
                    Icons.grid_view,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFAB() {
    return FloatingActionButton(child: const Icon(Icons.add), onPressed: () {});
  }

//

  TextStyle myTextStyle() {
    return TextStyle(
      fontSize: height * 0.05,
      color: Colors.white,
    );
  }
}
