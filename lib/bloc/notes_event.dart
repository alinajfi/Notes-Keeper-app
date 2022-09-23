part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class GetAllNotesEvent extends NotesEvent {}

class CreateNoteEvent extends NotesEvent {
  CreateNoteEvent({required this.note});

  final Notes note;
}

class DeleteNoteEvent extends NotesEvent {
  DeleteNoteEvent({required this.id});

  final int? id;
}

class UpdateNoteEvent extends NotesEvent {
  UpdateNoteEvent({required this.note});

  final Notes note;
}

class DeleteAllNoteEvent extends NotesEvent {}

class ShowNotesInGridEvent extends NotesEvent {}

class ShowNotesInListEvent extends NotesEvent {}
