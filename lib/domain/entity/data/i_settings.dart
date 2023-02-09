import 'package:flutter/widgets.dart';

@immutable
abstract class ISettings {
  final String userId;

  const ISettings({
    required this.userId,
  });

  Map<String, dynamic> toMap();

  ISettings copyWith({
    String? userId,
  });
}
