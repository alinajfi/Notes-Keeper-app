import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_version_2/utils/routeconst.dart';

class ListOrGridView {
  Random random = Random();
  Widget homePageListView(double height, double width) {
    return ListView.builder(
      itemCount: 40,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.13,
            width: width,
            decoration: myBoxDecoration(),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, RouteConst.viewNote);
              },
              title: const Text('okay'),
            ),
          ),
        );
      },
    );
  }

  Widget homePageGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: myBoxDecoration(),
            //  color: Colors.green,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteConst.viewNote);
              },
            ),
          ),
        );
      },
    );
  }

  myBoxDecoration() {
    return BoxDecoration(
      color: Colors.primaries[random.nextInt(Colors.primaries.length)],
      borderRadius: BorderRadius.circular(10),
      // border: Border.all(width: 3, color: Colors.grey),
    );
  }
}
