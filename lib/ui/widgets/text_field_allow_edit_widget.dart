import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sales_counter/core/localized/generated/l10n.dart';

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
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        label: labelText,
        readOnly: !isAllowEdit,
      ),
      child: Stack(
        alignment: Alignment.topRight,
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
              tooltip: S.current.allowEdit,
              onPressed: changeAllowEdit,
              icon: const Icon(
                Icons.edit,
                size: 16,
                color: Colors.blue,
              ),
            )
          else
            const SizedBox.shrink()
        ],
      ),
    );
  }
}
