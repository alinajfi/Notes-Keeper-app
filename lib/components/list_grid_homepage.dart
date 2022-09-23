import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_version_2/bloc/notes_bloc.dart';
import 'package:note_version_2/models/notes_model.dart';
import 'package:note_version_2/utils/routeconst.dart';

class ListOrGridView {
  Random random = Random();
  Widget homePageListView(
      double height, double width, List<Notes> list, BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: height * 0.13,
              width: width,
              decoration: myBoxDecoration(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListTile(
                  onLongPress: () {
                    deletNoteDialogue(list, index, context);
                  },
                  onTap: () {
                    Notes note = list[index];
                    Navigator.pushNamed(context, RouteConst.viewNote,
                        arguments: note);
                  },
                  title: Text(
                    list[index].title,
                    style: GoogleFonts.aladin(
                        color: Colors.white, fontSize: height * 0.04),
                  ),
                  subtitle: Text(
                    maxLines: 1,
                    list[index].body,
                    style: GoogleFonts.abel(
                        color: Colors.white, fontSize: height * 0.03),
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget homePageGridView(
      List<Notes> list, double height, double width, BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: myBoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: InkWell(
                splashColor: Colors.white,
                onLongPress: () {
                  deletNoteDialogue(list, index, context);
                },
                onTap: () {
                  Notes note = list[index];
                  Navigator.pushNamed(
                    context,
                    RouteConst.viewNote,
                    arguments: note,
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        maxLines: 1,
                        list[index].title.toString(),
                        style: GoogleFonts.aladin(
                            color: Colors.white, fontSize: height * 0.04),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        list[index].body.toString(),
                        maxLines: 1,
                        style: GoogleFonts.abel(
                            color: Colors.white, fontSize: height * 0.03),
                      ),
                    ),
                  ],
                ),
              ),
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

  deletNoteDialogue(List<Notes> list, int index, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: Text(
            'Delete',
            style: GoogleFonts.abel(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey.withOpacity(0.6),
          content: Text(
            '''Are you sure you want to delete 
this note?''',
            style: GoogleFonts.adamina(),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<NotesBloc>()
                      .add(DeleteNoteEvent(id: list[index].id));
                  Navigator.pop(context);
                },
                child: const Text('Yes')),
          ],
        );
      },
    );
  }
}
