import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_version_2/bloc/notes_bloc.dart';
import 'package:note_version_2/components/my_action_btn.dart';
import 'package:note_version_2/components/my_text_feilds.dart';
import 'package:note_version_2/models/notes_model.dart';
import 'package:note_version_2/repositry/repositry.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final NotesRepository repository = NotesRepository();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2, child: createNoteFirstRow(height, width, context)),
              SizedBox(
                height: height * 0.04,
              ),
              Expanded(flex: 20, child: editTextFeilds(height, width)),
            ],
          ),
        ),
      ),
    );
  }

  Widget createNoteFirstRow(double height, double width, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyActionButton(
            icon: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            }),
        MyActionButton(
          icon: const Text(
            'save',
            style: TextStyle(color: Colors.black),
          ),
          onTap: _onSave(),
        ),
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

  VoidCallback _onSave() {
    return () {
      context.read<NotesBloc>().add(CreateNoteEvent(
          note: Notes(
              title: _titleController.text.toString(),
              body: _bodyController.text.toString())));
      Navigator.pop(context);
    };
  }
}
