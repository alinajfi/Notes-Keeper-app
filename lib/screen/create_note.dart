import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_version_2/bloc/notes_bloc.dart';

import '../models/notes_model.dart';

class CrateNote extends StatelessWidget {
  CrateNote({Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: Column(
        children: [
          updateNoteFirstRow(height, width, context),
          editTextFeilds(height, width),
        ],
      ),
    );
  }

  Widget updateNoteFirstRow(double height, double width, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          // onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            width: width * 0.1,
            height: height * 0.04,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: const Color.fromARGB(255, 148, 132, 132),
                width: 3,
              ),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: height * 0.03,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            context.read<NotesBloc>().add(CreateNoteEvent(
                  note:Notes(
                    title: _titleController.text,
                    body: _bodyController.text,
                  ),
                ));
          },
          child: Container(
            alignment: Alignment.center,
            width: width * 0.13,
            height: height * 0.04,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: const Color.fromARGB(255, 148, 132, 132),
                width: 3,
              ),
            ),
            child: Text(
              'Save',
              style: TextStyle(
                  fontSize: height * 0.02, color: Colors.grey.shade400),
            ),
          ),
        ),
      ],
    );
  }

  Widget editTextFeilds(double height, double width) {
    return SizedBox(
      height: height,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: TextFormField(
              //initialValue: _intialValueForTitle(),
              controller: _titleController,
              autofocus: true,
              cursorColor: Colors.yellow,
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
              minLines: 1,
              maxLength: 80,
              decoration: InputDecoration(
                hintText: 'Enter title here',
                hintStyle: const TextStyle(color: Colors.grey),
                constraints: BoxConstraints(
                    maxHeight: height * 0.07, maxWidth: width * 0.9),
                counterStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Divider(
          //   color: Colors.grey,
          //   thickness: height * 0.002,
          // ),
          Expanded(
            child: TextFormField(
              // initialValue: _intialValue(),
              controller: _bodyController,
              autofocus: true,
              cursorColor: Colors.yellow,
              style: const TextStyle(color: Colors.white),
              minLines: 1,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter Your Note',
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                constraints: BoxConstraints(
                    maxHeight: height * 0.07, maxWidth: width * 0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
