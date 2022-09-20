part of 'notes_bloc.dart';

@immutable
abstract class NotesState {}

class InitialNotesState extends NotesState {}


class NotesLoadedState extends NotesState {
  final List<Notes> list;
  NotesLoadedState(this.list);
}
