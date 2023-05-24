import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqlite_flutter/data/database/db_service.dart';

import '../../../../domain/models/db_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial()) {
    getNotes();
  }

  Future<void> getNotes() async {
    emit(NotesLoading());
    try {
      final notes = await DbService().getData();
      emit(NotesLoaded(notes: notes));
    } catch (e) {
      emit(NotesError());
    }
  }
}
