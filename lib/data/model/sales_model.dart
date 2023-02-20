import 'package:flutter/foundation.dart';
import 'package:sales_counter/domain/entity/data/i_sales.dart';

class SalesModel extends ISales {
  const SalesModel({
    required super.userID,
    required super.count,
    required super.sales,
  });

  factory SalesModel.emptyClient([String? userID]) => SalesModel(
        userID: userID ?? '',
        count: 0,
        sales: const [],
      );

  factory SalesModel.empty() => const SalesModel(
        userID: '',
        count: 0,
        sales: [],
      );

  //<editor-fold desc="Data Methods">
  @override
  ISales copyWith({
    String? userID,
    int? count,
    List<String>? sales,
  }) {
    return SalesModel(
      userID: userID ?? this.userID,
      count: count ?? this.count,
      sales: sales ?? this.sales,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ISales &&
          runtimeType == other.runtimeType &&
          userID == other.userID &&
          count == other.count &&
          listEquals(sales, other.sales));

  @override
  int get hashCode => userID.hashCode ^ count.hashCode ^ sales.hashCode;

  @override
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'count': count,
      'sales': sales,
    };
  }

  factory SalesModel.fromMap(Map<String, dynamic> map) {
    return SalesModel(
      userID: map['userID'] as String? ?? '',
      count: map['count'] as int? ?? 0,
      // ignore: avoid_dynamic_calls
      sales: map['sales']?.cast<String>() ?? <String>[],
    );
  }
//</editor-fold>
}
