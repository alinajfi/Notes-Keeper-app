import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_version_2/database/notes_dbhelper.dart';
import 'package:note_version_2/models/notes_model.dart';
part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesDbHelper dbHelper = NotesDbHelper();
  NotesBloc() : super(NotesInitial()) {
    on<CreateNoteEvent>((event, emit) async {
      dbHelper.insertIntoDb(event.note);
      List<Notes> list = await dbHelper.viewData();
      emit(CreateNoteState(list
      ));
    });
  }
}
