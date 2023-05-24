part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesLoaded extends NotesState {
  final List<DbModel> notes;
  NotesLoaded({
    required this.notes,
  });
}

class NotesError extends NotesState {}
