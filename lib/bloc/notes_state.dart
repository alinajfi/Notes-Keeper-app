part of 'notes_bloc.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class CreateNoteState extends NotesState {
  final List<Notes> list;
  CreateNoteState(this.list);
}
