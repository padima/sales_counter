import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    required this.value,
    required this.name,
    this.changeCheckBox,
    Key? key,
  }) : super(key: key);

  final bool value;
  final void Function()? changeCheckBox;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 30,
            width: 10,
            child: Checkbox(
              splashRadius: 10.0,
              value: value,
              onChanged: changeCheckBox != null ? (value) => changeCheckBox!() : null,
            ),
          ),
        ),
        Expanded(
          flex: 14,
          child: GestureDetector(
            onTap: changeCheckBox,
            child: Text(
              name,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
