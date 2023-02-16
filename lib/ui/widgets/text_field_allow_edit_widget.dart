import 'package:flutter/material.dart';

class TextFieldAllowEditWidget extends StatelessWidget {
  const TextFieldAllowEditWidget({
    required this.labelText,
    required this.controller,
    required this.isAllowEdit,
    this.icon,
    this.onTapAllowEdit,
    this.keyboardType,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final TextInputType? keyboardType;
  final IconData? icon;
  final bool isAllowEdit;
  final void Function()? onTapAllowEdit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              constraints: const BoxConstraints(
                minHeight: 64,
              ),
              iconSize: 22,
              alignment: Alignment.bottomRight,
              onPressed: onTapAllowEdit,
              icon: const Icon(
                Icons.edit,
                size: 26,
                color: Colors.blue,
              ),
            ),
          )
        else
          const SizedBox.shrink()
      ],
    );
  }
}
