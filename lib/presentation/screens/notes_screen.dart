import 'package:flutter/material.dart';
import 'package:sqlite_flutter/presentation/screens/cubit/notes/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_flutter/presentation/widgets/note_widget.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mis notas',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            if (state is NotesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is NotesError) {
              return const Center(
                child: Text(
                  'Error al cargar las notas',
                ),
              );
            }
            if (state is NotesLoaded) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 213, 123, 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: state.notes.length,
                    itemBuilder: (context, index) {
                      return NoteWidget(
                        title: state.notes[index].title,
                        description: state.notes[index].description,
                        id: state.notes[index].id,
                      );
                    },
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
