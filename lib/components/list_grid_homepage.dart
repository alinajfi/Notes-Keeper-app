import 'package:flutter/material.dart';

class ListOrGridView {
  Widget homePageListView(double height, double width) {
    return ListView.builder(
      itemCount: 40,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: height * 0.1,
            width: width,
            decoration: myBoxDecoration(),
            child: const ListTile(
              title: Text('okay'),
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
          ),
        );
      },
    );
  }

  myBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 3, color: Colors.grey));
  }
}
