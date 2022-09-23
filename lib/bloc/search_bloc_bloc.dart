import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_version_2/repositry/repositry.dart';

import '../models/notes_model.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

class SearchBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  final NotesRepository _notesRepository = NotesRepository();
  SearchBloc() : super(SearchBlocInitial()) {
    on<SearchGetAllNotesEvent>((event, emit) async {
      List<Notes> notes = await _notesRepository.getNotesList();
      emit.call(SearchGetAllNotesState(list: notes));
    });

    on<SearchWithTextFeildEvent>((event, emit) async {
      String text = event.text;
      List<Notes> notesList = await _notesRepository.getNotesList();
      List<Notes> filteredList = [];

      filteredList = notesList
          .where(
              (note) => note.title.toLowerCase().contains(text.toLowerCase()))
          .toList();

      if (text.isEmpty) {
        emit.call(SearchWithTextState(filteredNotes: notesList));
      } else {
        emit.call(SearchWithTextState(filteredNotes: filteredList));
      }
    });
  }
}
