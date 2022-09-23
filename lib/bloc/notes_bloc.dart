// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_version_2/models/notes_model.dart';
import 'package:note_version_2/repositry/repositry.dart';
part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final NotesRepository _repository = NotesRepository();

  NotesBloc() : super(InitialNotesState()) {
    on<GetAllNotesEvent>((event, emit) async {
      List<Notes> list = await _repository.getNotesList();
      emit(GetAllNotesState(list));
    });

    on<CreateNoteEvent>((event, emit) async {
      await _repository.createNote(event.note);
      List<Notes> notes = await _repository.getNotesList();
      emit.call(CreateNotesState(list: notes));
    });

    on<UpdateNoteEvent>((event, emit) async {
      await _repository.updateNote(event.note);
      List<Notes> list = await _repository.getNotesList();
      emit.call(UpdateNoteState(list: list));
    });

    on<DeleteNoteEvent>((event, emit) async {
      await _repository.deletNote(event.id);
      List<Notes> list = await _repository.getNotesList();
      emit.call(DeleteNoteState(list: list));
    });

    on<DeleteAllNoteEvent>((event, emit) async {
      await _repository.deleteAllNotes();
      emit.call(DeleteAllNoteState());
    });
  }
}
