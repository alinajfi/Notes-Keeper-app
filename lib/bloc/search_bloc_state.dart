part of 'search_bloc_bloc.dart';

@immutable
abstract class SearchBlocState {}

class SearchBlocInitial extends SearchBlocState {}

class SearchGetAllNotesState extends SearchBlocState {
  SearchGetAllNotesState({required this.list});
  final List<Notes> list;
}

class SearchWithTextState extends SearchBlocState {
  final List<Notes> filteredNotes;
  SearchWithTextState({required this.filteredNotes});
}
