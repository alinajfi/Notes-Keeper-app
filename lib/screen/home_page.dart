// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_version_2/bloc/notes_bloc.dart';
import 'package:note_version_2/components/my_action_btn.dart';
import 'package:note_version_2/utils/routeconst.dart';

import '../components/list_grid_homepage.dart';
import '../models/notes_model.dart';

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
  late List<Notes> notesList;
  late ListOrGridView listOrGrid;

  @override
  void initState() {
    super.initState();
    listOrGrid = ListOrGridView();
    context.read<NotesBloc>().add(GetAllNotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
      child: Scaffold(
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
                child: blocBuilder(),
              ),
            ],
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
            style: GoogleFonts.alata(
                color: Colors.white,
                textStyle: TextStyle(fontSize: height * 0.03)),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyActionButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, RouteConst.searchNote);
                  }),
              MyActionButton(
                  onTap: () {
                    deleteAllNotesDialog();
                  },
                  icon: const Icon(
                    Icons.delete_outline,
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
            style: GoogleFonts.adamina(
                color: Colors.white,
                fontSize: height * 0.02,
                decoration: TextDecoration.underline),
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

  Widget blocBuilder() {
    return BlocBuilder<NotesBloc, NotesState>(
      builder: (context, state) {
        debugPrint(state.toString());
        if (state is InitialNotesState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetAllNotesState) {
          notesList = state.list;

          myListView =
              listOrGrid.homePageListView(height, width, notesList, context);
          myGridView =
              listOrGrid.homePageGridView(notesList, height, width, context);

          return gridOrlist ? myListView : myGridView;
        } else if (state is CreateNotesState) {
          notesList = state.list;

          myListView =
              listOrGrid.homePageListView(height, width, notesList, context);
          myGridView =
              listOrGrid.homePageGridView(notesList, height, width, context);
          return gridOrlist ? myListView : myGridView;
        } else if (state is UpdateNoteState) {
          notesList = state.list;
          myListView =
              listOrGrid.homePageListView(height, width, notesList, context);
          myGridView =
              listOrGrid.homePageGridView(notesList, height, width, context);
          return gridOrlist ? myListView : myGridView;
        } else if (state is DeleteNoteState) {
          notesList = state.list;
          myListView =
              listOrGrid.homePageListView(height, width, notesList, context);
          myGridView =
              listOrGrid.homePageGridView(notesList, height, width, context);
          return gridOrlist ? myListView : myGridView;
        } else if (state is DeleteAllNoteState) {
          notesList = [];

          return Center(
              child: SizedBox(
            height: height * 0.7,
            width: width * 0.8,
            child: Image.asset(
              r'assets/images/documents.png',
              //  color: Colors.blue.withOpacity(0.3),
            ),
          ));
        } else {
          return Center(
              child: Text('Somthing went Wrong',
                  style: GoogleFonts.aladin(color: Colors.white)));
        }
      },
    );
  }

  Widget buildFAB() {
    return TweenAnimationBuilder<Offset>(
      curve: Curves.bounceInOut,
      duration: const Duration(seconds: 3),
      tween:
          Tween<Offset>(begin: Offset(0, -height * 2), end: const Offset(0, 0)),
      builder: (context, offset, child) {
        return Transform.translate(
          offset: offset,
          child: child,
        );
      },
      child: FloatingActionButton(
          elevation: 10,
          backgroundColor:
              Colors.primaries[random.nextInt(Colors.primaries.length)],
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, RouteConst.createNote);
          }),
    );
  }

  deleteAllNotesDialog() {
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
all notes?''',
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
                  context.read<NotesBloc>().add(DeleteAllNoteEvent());
                  Navigator.pop(context);
                },
                child: const Text('yes')),
          ],
        );
      },
    );
  }
}
