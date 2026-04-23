
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTilePage extends StatefulWidget {
  final String taskName;
  final bool taskComplite;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;

  TodoTilePage({
    super.key,
    required this.taskName,
    required this.taskComplite,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  State<TodoTilePage> createState() => _TodoTilePageState();
}

class _TodoTilePageState extends State<TodoTilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              backgroundColor: Colors.red.shade300,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: widget.editFunction,
              backgroundColor: Colors.yellow.shade300,
              icon: Icons.edit,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          child: Row(
            children: [
              Checkbox(
                value: widget.taskComplite,
                onChanged: widget.onChanged,
                activeColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              Text(
                widget.taskName,
                style: TextStyle(
                  decoration: widget.taskComplite
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.all(15),
        ),
      ),
    );
  }
}
