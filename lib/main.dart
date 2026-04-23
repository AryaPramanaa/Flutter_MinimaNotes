import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minima_notes/pages/notes_page.dart';
import 'package:minima_notes/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: NotesPage(),theme: Provider.of<ThemeProvider>(context).themeData,);
  }
}
