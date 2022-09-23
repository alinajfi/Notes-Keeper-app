part of 'search_bloc_bloc.dart';

@immutable
abstract class SearchBlocEvent {}

class SearchGetAllNotesEvent extends SearchBlocEvent {}

class SearchWithTextFeildEvent extends SearchBlocEvent {
  final String text;
  SearchWithTextFeildEvent(this.text);
}
