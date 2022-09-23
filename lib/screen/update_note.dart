import 'package:flutter/material.dart';
import 'package:note_version_2/components/my_action_btn.dart';
import 'package:note_version_2/components/my_text_feilds.dart';

class UpdateNote extends StatefulWidget {
  const UpdateNote({Key? key}) : super(key: key);

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();

    super.dispose();
  }

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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(flex: 2, child: updateNoteFirstRow()),
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(flex: 20, child: editTextFeilds(height, width)),
          ]),
        ),
      ),
    );
  }

  Widget updateNoteFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyActionButton(
            icon: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            }),
        MyActionButton(icon: const Text('Edit'), onTap: () {}),
      ],
    );
  }

  Widget editTextFeilds(double height, double width) {
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: MyTextFeild(
              boxConstraints: BoxConstraints(
                  maxHeight: height * 0.05, maxWidth: width * 0.9),
              controller: _titleController,
              hintText: 'Enter Title here',
              maxLength: 80,
              maxLines: 2,
              minLines: 1,
              counterStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.grey),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: height * 0.002,
          ),
          Expanded(
            flex: 7,
            child: MyTextFeild(
                controller: _bodyController,
                maxLines: 60,
                minLines: 1,
                hintText: 'Enter Your Note',
                boxConstraints: BoxConstraints(
                    maxHeight: height * 0.09, maxWidth: width * 0.9),
                hintStyle: const TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
