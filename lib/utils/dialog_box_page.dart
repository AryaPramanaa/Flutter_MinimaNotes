import 'package:flutter/material.dart';
import 'package:minima_notes/utils/button.dart';

class DialogBoxPage extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBoxPage({super.key, required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: Container(
        height: 150,
        width: 300,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(        
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Type Your ToDo',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                controller: controller ,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(text: "SAVE", onPressed: onSave),
                    Button(text: "CANCEL", onPressed: onCancel)
                  ],
                ),
              )      
            ],
          ),
        ),
      ),
    );
  }
}