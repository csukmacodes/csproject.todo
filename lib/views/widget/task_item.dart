import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

/// created by : candra
/// email : csukma.codes@gmail.com
/// date : Feb 14, 2024 08:40:53
/// project : todo

class TaskItem extends StatelessWidget {
  const TaskItem(
      {super.key,
      this.isDone = false,
      this.checkVal = false,
      this.editTap = false,
      this.title = "",
      required this.editController,
      this.onSubmit,
      this.onChange,
      this.editOnTap});

  final bool isDone;
  final bool checkVal;
  final bool editTap;
  final String title;

  final TextEditingController editController;
  final Function(String? val)? onSubmit;
  final Function(bool? val)? onChange;
  final VoidCallback? editOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isDone
            ? IconButton(
                icon: FaIcon(FontAwesomeIcons.check, color: Colors.blue[200]),
                iconSize: 20,
                onPressed: null,
              )
            : Checkbox(value: checkVal, activeColor: Colors.green, onChanged: onChange),
        Expanded(child: _textItem()),
        isDone
            ? IconButton(
                icon: const FaIcon(FontAwesomeIcons.trash),
                iconSize: 20,
                onPressed: () {
                  print("Pressed");
                })
            : const SizedBox()
      ],
    );
  }

  Widget _textItem() {
    if (editTap) {
      return TextField(
        onSubmitted: onSubmit,
        autofocus: true,
        controller: editController,
        style: GoogleFonts.robotoFlex(
          fontSize: 24,
          fontStyle: FontStyle.normal,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(0),
          hintText: 'New Task',
        ),
      );
    }
    return InkWell(
        onTap: editOnTap,
        child: Text(
          title,
          style: GoogleFonts.robotoFlex(
            fontSize: 24,
            fontStyle: FontStyle.normal,
          ),
        ));
  }
}
