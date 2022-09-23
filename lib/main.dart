import 'package:flutter/material.dart';
import 'package:note_version_2/bloc/notes_bloc.dart';
import 'package:note_version_2/bloc/search_bloc_bloc.dart';
import 'package:note_version_2/routes/my_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_version_2/screen/home_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<NotesBloc>(
        create: (context) {
          return NotesBloc();
        },
      ),
      BlocProvider<SearchBloc>(
        create: (context) {
          return SearchBloc();
        },
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: 'Georgia ',
      ),
      onGenerateRoute: MyRoutes.myRoutes,
      home: const HomePage(),
    );
  }
}
