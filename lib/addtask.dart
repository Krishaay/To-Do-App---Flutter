// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do_list/button.dart';

class AddTask extends StatelessWidget {
  final TextEditingController controller;

  final VoidCallback onSave;
  final VoidCallback onCancel;

  const AddTask({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // user input
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: "Add a new task"),
            ),

            SizedBox(height: 20,),

            // buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // save btn
                NewButton(text: "SAVE", onPressed: onSave),

                // cancel btn
                NewButton(text: "CANCEL", onPressed: onCancel)
              ],
            )

          ],
        ),
      ),
    );
  }
}