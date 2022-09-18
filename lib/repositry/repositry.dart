import 'package:note_version_2/database/notes_dbhelper.dart';
import 'package:note_version_2/models/notes_model.dart';

class NotesRepository {
  final NotesDbHelper _notesDbHelper = NotesDbHelper();

  Future<List<Notes>> getNotesList() async => await _notesDbHelper.viewData();
  Future<void> closeDataBase() async => await _notesDbHelper.closeDataBase();
  Future<bool> deleteAllNotes() async => await _notesDbHelper.deleteAllNotes();
  Future<bool> createNote(Notes note) async =>
      await _notesDbHelper.insertIntoDb(note);
  Future<bool> deletNote(int noteId) async =>
      await _notesDbHelper.deleteNote(noteId);
  Future<bool> updateNote(Notes note) async =>
      await _notesDbHelper.updateNote(note);
}
