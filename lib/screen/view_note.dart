import 'package:flutter/material.dart';
import 'package:note_version_2/components/my_action_btn.dart';

class ViewNote extends StatelessWidget {
  const ViewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(children: [
            Expanded(flex: 1, child: viewNoteActionBar()),
            Expanded(flex: 8, child: viewNoteTextFeilds(height, width)),
          ]),
        ),
      ),
    );
  }

  Widget viewNoteActionBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyActionButton(icon: const Icon(Icons.arrow_back), onTap: () {}),
        MyActionButton(icon: const Icon(Icons.edit), onTap: () {}),
      ],
    );
  }

  Widget viewNoteTextFeilds(double height, double width) {
    return Column(
      children: [
        const Text(''),
        Divider(
          color: Colors.grey,
          thickness: height * 0.002,
        ),
        const Text(''),
      ],
    );
  }
}
