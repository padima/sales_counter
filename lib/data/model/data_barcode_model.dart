import 'package:flutter/widgets.dart';
import 'package:sales_counter/domain/entity/data/i_data_barcode.dart';

@immutable
class DataBarcodeModel extends IDataBarcode {
  factory DataBarcodeModel.empty() => const DataBarcodeModel(
        userId: '',
        userEmail: '',
        userName: '',
      );

  //<editor-fold desc="Data Methods">
  const DataBarcodeModel({
    required super.userId,
    required super.userName,
    required super.userEmail,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DataBarcodeModel &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          userName == other.userName &&
          userEmail == other.userEmail);

  @override
  int get hashCode => userId.hashCode ^ userName.hashCode ^ userEmail.hashCode;

  @override
  String toString() {
    return 'IDataBarcode{ userId: $userId, userName: $userName, userEmail: $userEmail,}';
  }

  @override
  IDataBarcode copyWith({
    String? userId,
    String? userName,
    String? userEmail,
  }) {
    return DataBarcodeModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'userName': this.userName,
      'userEmail': this.userEmail,
    };
  }

  factory DataBarcodeModel.fromMap(Map<String, dynamic> map) {
    return DataBarcodeModel(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      userEmail: map['userEmail'] as String,
    );
  }

//</editor-fold>
}
