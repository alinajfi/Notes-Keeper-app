part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class GetAllNotesEvent extends NotesEvent {}

class DeleteNoteEvent extends NotesEvent {}

class UpdateNoteEvent extends NotesEvent {}

class DeleteAllNoteEvent extends NotesEvent {}
