import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return Semantics.fromProperties(
      properties: SemanticsProperties(label: name),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              width: 48,
              child: Checkbox(
                splashRadius: 48,
                value: value,
                onChanged: changeCheckBox != null ? (value) => changeCheckBox!() : null,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: changeCheckBox,
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                height: 48,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 16),
                    semanticsLabel: name,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
