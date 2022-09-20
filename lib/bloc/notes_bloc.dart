// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_version_2/models/notes_model.dart';
import 'package:note_version_2/repositry/repositry.dart';
part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesRepository repository = NotesRepository();
  NotesBloc() : super(InitialNotesState()) {
    on<CreateNoteEvent>((event, emit) async {
      repository.createNote(event.note);
      List<Notes> list = await repository.getNotesList();
      emit(NotesLoadedState(list));
    });
  }
}
