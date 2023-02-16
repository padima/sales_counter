import 'package:flutter/widgets.dart';

mixin MixinTextEditControllerManager {
  final _controllersTextEditing = <String, TextEditingController>{};
  Map<String, String> defaultTextEditingValues = {};

  TextEditingController getTextEditingController(String nameController) {
    final controller = _controllersTextEditing[nameController] ??=
        TextEditingController(text: _getDefaultValueTextEditing(nameController));
    return controller;
  }

  void setTextEditingController({
    required String nameController,
    required TextEditingController controller,
  }) {
    _controllersTextEditing[nameController] = controller;
  }

  String getValueTextEditing(String nameController) {
    return _controllersTextEditing[nameController]?.text ?? '';
  }

  String _getDefaultValueTextEditing(String nameController) {
    return defaultTextEditingValues[nameController] ?? '';
  }
}
