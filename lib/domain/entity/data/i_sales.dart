import 'package:flutter/widgets.dart';

@immutable
abstract class ISales {
  final String userID;
  final int count;
  final List<String> sales;

//<editor-fold desc="Data Methods">
  const ISales({
    required this.userID,
    required this.count,
    required this.sales,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ISales &&
          runtimeType == other.runtimeType &&
          userID == other.userID &&
          count == other.count &&
          sales == other.sales);

  @override
  int get hashCode => userID.hashCode ^ count.hashCode ^ sales.hashCode;

  ISales copyWith({
    String? userID,
    int? count,
    List<String>? sales,
  });

  Map<String, dynamic> toMap();
//</editor-fold>
}
