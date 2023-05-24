import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_flutter/data/database/db_service.dart';
import 'package:sqlite_flutter/presentation/screens/notes_screen.dart';
import 'package:sqlite_flutter/presentation/widgets/main_button.dart';

import 'cubit/notes/notes_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Flutter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 213, 123, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(250, 232, 185, 1),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Título:',
                            ),
                            Expanded(
                              child: TextField(
                                controller: _titleController,
                                cursorWidth: 2,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Contenido:',
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.3,
                              child: TextField(
                                controller: _descriptionController,
                                cursorWidth: 2,
                                maxLines: 5,
                                minLines: 1,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                final notesCubit = context.read<NotesCubit>();
                                final scaffoldMessenger =
                                    ScaffoldMessenger.of(context);
                                if (_titleController.text.isNotEmpty &&
                                    _descriptionController.text.isNotEmpty) {
                                  await DbService().insertData(
                                    _titleController.text,
                                    _descriptionController.text,
                                  );
                                  _descriptionController.clear();
                                  _titleController.clear();
                                  scaffoldMessenger.showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Datos insertados correctamente',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                                notesCubit.getNotes();
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.edit,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _descriptionController.clear();
                                _titleController.clear();
                                setState(() {});
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.delete,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            MainButton(
              text: 'Ver notas',
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
