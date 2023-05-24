import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_flutter/data/database/db_service.dart';

import '../screens/cubit/notes/notes_cubit.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.id,
  }) : super(key: key);
  final String title;
  final String description;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 213, 123, 1),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(250, 232, 185, 1),
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(250, 232, 185, 1),
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () async {
                            final notesCubit =
                                BlocProvider.of<NotesCubit>(context);
                            await DbService().deleteData(id);
                            notesCubit.getNotes();
                          },
                          child: const Icon(Icons.delete))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(250, 232, 185, 1),
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
