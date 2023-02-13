import 'package:sales_counter/domain/entity/data/i_sales.dart';

class SalesModel extends ISales {
  const SalesModel({
    required super.userID,
    required super.count,
    required super.sales,
  });

  factory SalesModel.empty([String? userID]) => SalesModel(
        userID: userID ?? '',
        count: 0,
        sales: const [],
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
  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'count': count,
      'sales': sales,
    };
  }

  factory SalesModel.fromMap(Map<String, dynamic> map) {
    return SalesModel(
      userID: map['userID'] as String,
      count: map['count'] as int,
      sales: map['sales'] as List<String>,
    );
  }
//</editor-fold>
}
