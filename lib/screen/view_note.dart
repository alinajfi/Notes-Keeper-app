import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_version_2/bloc/notes_bloc.dart';
import 'package:note_version_2/components/my_action_btn.dart';
import 'package:note_version_2/models/notes_model.dart';
import 'package:note_version_2/utils/routeconst.dart';

class ViewNote extends StatelessWidget {
  const ViewNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var note = ModalRoute.of(context)!.settings.arguments as Notes;
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(children: [
            Expanded(flex: 1, child: viewNoteActionBar(context, size, note)),
            Expanded(flex: 8, child: viewNoteTextFeilds(height, width, note)),
          ]),
        ),
      ),
    );
  }

  Widget viewNoteActionBar(BuildContext context, Size size, Notes note) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyActionButton(
            icon: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            }),
        Row(
          children: [
            MyActionButton(
                icon: const Icon(Icons.edit),
                onTap: () {
                  Navigator.pushNamed(context, RouteConst.updateNote,
                      arguments: note);
                }),
            SizedBox(
              width: size.width * 0.02,
            ),
            MyActionButton(
                icon: const Icon(Icons.delete),
                onTap: () {
                  context.read<NotesBloc>().add(DeleteNoteEvent(id: note.id));

                  Navigator.pop(context);
                })
          ],
        )
      ],
    );
  }

  Widget viewNoteTextFeilds(double height, double width, Notes note) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.title,
              style: GoogleFonts.aladin(
                  color: Colors.white, fontSize: height * 0.03)),
          Divider(
            color: Colors.grey,
            thickness: height * 0.002,
          ),
          Text(
            maxLines: null,
            note.body,
            style: GoogleFonts.aladin(
                color: Colors.white, fontSize: height * 0.04),
          ),
        ],
      ),
    );
  }
}
