import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_version_2/bloc/search_bloc_bloc.dart';
import 'package:note_version_2/components/my_action_btn.dart';
import 'package:note_version_2/models/notes_model.dart';
import 'package:note_version_2/utils/routeconst.dart';

class SearchNote extends StatefulWidget {
  const SearchNote({Key? key}) : super(key: key);

  @override
  State<SearchNote> createState() => _SearchNoteState();
}

class _SearchNoteState extends State<SearchNote> {
  final TextEditingController _searchController = TextEditingController();
  Random random = Random();

  late Size size;
  late double height;
  late double width;
  List<Notes> notesList = [];
  bool suffixIcon = false;

  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(SearchGetAllNotesEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: searchNoteFirstRow()),
            SizedBox(height: height * 0.02),
            Expanded(
              flex: 1,
              child: serchTextFeild(),
            ),
            Expanded(flex: 10, child: searchBlocBuilder()),
          ],
        ),
      ),
    );
  }

  Widget searchNoteFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyActionButton(
            icon: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            })
      ],
    );
  }

  Widget serchTextFeild() {
    return TextFormField(
      controller: _searchController,
      onChanged: _onChangedText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        hintText: 'Search here',
        filled: true,
        fillColor: Colors.grey.withOpacity(0.5),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height * 0.3)),
        constraints: BoxConstraints(
          maxHeight: height * 0.06,
          maxWidth: width * 0.8,
        ),
      ),
    );
  }

  void _onChangedText(String value) {
    debugPrint('onchange text feild');
    context.read<SearchBloc>().add(SearchWithTextFeildEvent(
          value,
        ));
  }

  Widget searchBlocBuilder() {
    return BlocBuilder<SearchBloc, SearchBlocState>(
      builder: (context, state) {
        if (state is SearchBlocInitial) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.amber),
          );
        } else if (state is SearchGetAllNotesState) {
          List<Notes> list = state.list;

          return searchListView(list);
        } else if (state is SearchWithTextState) {
          List<Notes> list = state.filteredNotes;
          return searchListView(list);
        } else {
          return Center(
              child: Text('Something went wrong',
                  style: GoogleFonts.abel(color: Colors.white)));
        }
      },
    );
  }

  Widget searchListView(List<Notes> list) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              height: height * 0.11,
              width: width * 0.1,
              decoration: myBoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(list[index].title.toString(),
                      maxLines: 1,
                      style: GoogleFonts.abel(fontSize: height * 0.03)),
                  subtitle: Text(list[index].body.toString(),
                      maxLines: 1,
                      style: GoogleFonts.aladin(fontSize: height * 0.03)),
                  onTap: () {
                    Notes note = list[index];
                    Navigator.pushNamed(
                      context,
                      RouteConst.viewNote,
                      arguments: note,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  myBoxDecoration() {
    return BoxDecoration(
      color: Colors.primaries[random.nextInt(Colors.primaries.length)],
      borderRadius: BorderRadius.circular(10),
    );
  }
}
