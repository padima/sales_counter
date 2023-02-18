import 'package:flutter/material.dart';

class TextFieldAllowEditWidget extends StatelessWidget {
  const TextFieldAllowEditWidget({
    required this.labelText,
    required this.controller,
    required this.isAllowEdit,
    this.icon,
    this.changeAllowEdit,
    this.keyboardType,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final TextInputType? keyboardType;
  final IconData? icon;
  final bool isAllowEdit;
  final void Function()? changeAllowEdit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        TextField(
          enabled: isAllowEdit,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            icon: icon != null ? Icon(icon) : null,
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 2)),
          ),
        ),
        if (!isAllowEdit)
          IconButton(
            onPressed: changeAllowEdit,
            icon: const Icon(
              Icons.edit,
              size: 26,
              color: Colors.blue,
            ),
          )
        else
          const SizedBox.shrink()
      ],
    );
  }
}
