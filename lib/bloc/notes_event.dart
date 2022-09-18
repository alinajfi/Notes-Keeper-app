part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class CreateNoteEvent extends NotesEvent {
  Notes note;
  CreateNoteEvent({required this.note});
}

class DeleteNoteEvent extends NotesEvent {}

class UpdateNoteEvent extends NotesEvent {}

class DeleteAllNoteEvent extends NotesEvent {}
