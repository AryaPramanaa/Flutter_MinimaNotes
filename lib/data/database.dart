import 'package:hive_flutter/hive_flutter.dart';

class noteDatabase {

   List note = [];

  final _myBox = Hive.box('myBox');

  //INIT DATA
  void createInitialData (){
    note = [
      ["Make a Tutorial",false],
      ["Do a Something exercise",false]
    ];
  }

  //LOAD
  void loadData (){
    note = _myBox.get("NOTE");
  }

  //UPDATE
  void updateData(){
    _myBox.put("NOTE", note);
  }

  // EDIT
  void editTask(int index, String newText) {
    note[index][0] = newText;
    updateData();
  }


}