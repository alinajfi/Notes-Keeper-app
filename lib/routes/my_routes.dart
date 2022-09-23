import 'package:flutter/material.dart';
import 'package:note_version_2/screen/create_note.dart';
import 'package:note_version_2/screen/home_page.dart';
import 'package:note_version_2/screen/search_note.dart';
import 'package:note_version_2/screen/update_note.dart';
import 'package:note_version_2/screen/view_note.dart';
import 'package:note_version_2/utils/routeconst.dart';

class MyRoutes {
  static Route myRoutes(RouteSettings settings) {
    if (settings.name == RouteConst.homePage) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return const HomePage();
        },
      );
    } else if (settings.name == RouteConst.createNote) {
      return MaterialPageRoute(
        builder: (context) {
          return const CreateNote();
        },
      );
    } else if (settings.name == RouteConst.updateNote) {
      return MaterialPageRoute(
        builder: (context) {
          return const UpdateNote();
        },
      );
    } else if (settings.name == RouteConst.searchNote) {
      return MaterialPageRoute(
        builder: (context) {
          return const SearchNote();
        },
      );
    } else if (settings.name == RouteConst.viewNote) {
      print(settings.toString());
      return MaterialPageRoute(
        builder: (context) {
          return const ViewNote();
        },
        settings: settings,
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    }
  }
}
