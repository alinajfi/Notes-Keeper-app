import 'package:note_version_2/database/notes_dbhelper.dart';
import 'package:note_version_2/models/notes_model.dart';

class NotesRepository {
  final NotesDbHelper _notesDbHelper = NotesDbHelper();

  Future<List<Notes>> getNotesList() async => await _notesDbHelper.viewData();
  Future<void> closeDataBase() => _notesDbHelper.closeDataBase();
  Future<bool> deleteAllNotes() => _notesDbHelper.deleteAllNotes();
  Future<bool> createNote(Notes note) => _notesDbHelper.insertIntoDb(note);
  Future<bool> deletNote(int? noteId) => _notesDbHelper.deleteNote(noteId);
  Future<bool> updateNote(Notes note) => _notesDbHelper.updateNote(note);
}
