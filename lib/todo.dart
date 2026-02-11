import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskDone;

  final Function(BuildContext)? deleteFunction;

  final void Function(bool?)? onChanged;

  const ToDoTile({super.key, required this.taskName, required this.taskDone, required this.onChanged, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          extentRatio: 0.4, 
          children: [
            SlidableAction(onPressed: deleteFunction, 
            icon: Icons.delete, 
            backgroundColor: Color.fromRGBO(191, 70, 70, 1), 
            borderRadius: BorderRadius.circular(12),
            padding: EdgeInsets.only(left: 10),
            )
          ]
          ),

        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Color.fromRGBO(237, 220, 198, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              //done or nah
              Checkbox(value: taskDone, onChanged: onChanged, activeColor: Color.fromRGBO(191, 70, 70, 1),),
        
              //task name
              Text(taskName, 
                style: TextStyle( decoration: taskDone ? TextDecoration.lineThrough : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}