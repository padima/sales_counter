import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    required this.labelText,
    required this.isEnabled,
    required this.controller,
    this.icon,
    this.keyboardType,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final bool isEnabled;
  final TextEditingController controller;
  final IconData? icon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      enabled: isEnabled,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        icon: icon != null ? Icon(icon) : null,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 2),
        ),
      ),
    );
  }
}
