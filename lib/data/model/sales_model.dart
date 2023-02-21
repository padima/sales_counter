import 'package:sales_counter/domain/entity/data/i_sales.dart';

class SalesModel extends ISales {
  const SalesModel({
    required super.userID,
    required super.count,
  });

  factory SalesModel.emptyClient([String? userID]) => SalesModel(
        userID: userID ?? '',
        count: 0,
      );

  factory SalesModel.empty() => const SalesModel(
        userID: '',
        count: 0,
      );

  //<editor-fold desc="Data Methods">
  @override
  ISales copyWith({
    String? userID,
    int? count,
  }) {
    return SalesModel(
      userID: userID ?? this.userID,
      count: count ?? this.count,
    );
  }

  @override
  String toString() {
    return 'ISales{userID: $userID, count: $count}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ISales && runtimeType == other.runtimeType && userID == other.userID && count == other.count);

  @override
  int get hashCode => userID.hashCode ^ count.hashCode;

  @override
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'count': count,
    };
  }

  factory SalesModel.fromMap(Map<String, dynamic> map) {
    return SalesModel(
      userID: map['userID'] as String? ?? '',
      count: map['count'] as int? ?? 0,
    );
  }
//</editor-fold>
}
