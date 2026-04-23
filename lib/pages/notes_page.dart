import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:minima_notes/components/my_drawer.dart';
import 'package:minima_notes/data/database.dart';
import 'package:minima_notes/utils/dialog_box_page.dart';
import 'package:minima_notes/utils/todo_tile_page.dart';


class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  final _myBox = Hive.box('myBox');
  final _controller = TextEditingController();
  noteDatabase db = noteDatabase();

  void initState() {
    if (_myBox.get("NOTE") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //save
  void saveTask() {
    setState(() {
      db.note.add([_controller.text, false]);
      Navigator.of(context).pop();
      db.updateData();
    });
  }

  //create
  void createDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxPage(
          controller: _controller,
          onSave: saveTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //Function Check
  void checkBoxChange(bool? value, index) {
    setState(() {
      db.note[index][1] = !db.note[index][1];
      db.updateData();
    });
  }

  //Delete Task
  void deleteTask(int index) {
    setState(() {
      db.note.removeAt(index);
      db.updateData();
    });
  }

  //Edit Task

  void editTask(int index) {
    _controller.text = db.note[index][0];
    showDialog(
      context: context,
      builder: (context) {
        return DialogBoxPage(
          controller: _controller,
          onSave: () {
            setState(() {
              db.editTask(index, _controller.text); 
              _controller.clear();
            });
            Navigator.of(context).pop();
          },
          onCancel: () {
            _controller.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text("MINIMA NOTES"), centerTitle: true,backgroundColor: Theme.of(context).colorScheme.secondary,),
      drawer: MyDrawer(),
      body:  ListView.builder(
        itemCount: db.note.length,
        itemBuilder: (context, index) {
          return TodoTilePage(
            taskName: db.note[index][0],
            taskComplite: db.note[index][1],
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (context) => deleteTask(index),
            editFunction: (context) => editTask(index),
          );
        },
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: createDialog,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
