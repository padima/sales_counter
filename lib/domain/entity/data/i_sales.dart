import 'package:flutter/widgets.dart';

@immutable
abstract class ISales {
  final String userID;
  final int count;

//<editor-fold desc="Data Methods">
  const ISales({
    required this.userID,
    required this.count,
  });

  ISales copyWith({
    String? userID,
    int? count,
  });

  Map<String, dynamic> toMap();

//</editor-fold>
}
