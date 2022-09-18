// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_version_2/components/my_action_btn.dart';
import 'package:note_version_2/screen/create_note.dart';

import '../components/list_grid_homepage.dart';

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
  bool gridOrlist = true;
  late Widget myListView;
  late Widget myGridView;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    myListView = ListOrGridView().homePageListView(height, width);
    myGridView = ListOrGridView().homePageGridView();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: firstRow()),
            Expanded(flex: 1, child: secondRow()),
            Expanded(
              flex: 10,
              child: gridOrlist ? myListView : myGridView,
            ),
          ],
        ),
      ),
      floatingActionButton: buildFAB(),
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
                  onTap: _editAcitonCallBack,
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
            style: TextStyle(color: Colors.white, fontSize: height * 0.02),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyActionButton(
                  onTap: () {
                    setState(() {
                      gridOrlist = true;
                    });
                  },
                  icon: const Icon(
                    Icons.list_outlined,
                    color: Colors.white,
                  )),
              MyActionButton(
                  onTap: () {
                    setState(() {
                      gridOrlist = false;
                    });
                  },
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

  TextStyle myTextStyle() {
    return TextStyle(
      fontSize: height * 0.03,
      color: Colors.white,
    );
  }

  VoidCallback _editAcitonCallBack() {
    return () async {
      await Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return CreateNote();
        },
      ));
    };
  }
}
