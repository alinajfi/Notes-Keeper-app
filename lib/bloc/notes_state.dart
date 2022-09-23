part of 'notes_bloc.dart';

@immutable
abstract class NotesState {}

class InitialNotesState extends NotesState {}

class GetAllNotesState extends NotesState {
  final List<Notes> list;
  GetAllNotesState(this.list);
}

class CreateNotesState extends NotesState {
  final List<Notes> list;
  CreateNotesState({required this.list});
}

class UpdateNoteState extends NotesState {
  final List<Notes> list;
  UpdateNoteState({required this.list});
}

class DeleteNoteState extends NotesState {
  final List<Notes> list;
  DeleteNoteState({required this.list});
}

class DeleteAllNoteState extends NotesState {}
