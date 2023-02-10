import 'package:flutter/widgets.dart';
import 'package:sales_counter/domain/entity/data/i_settings.dart';

@immutable
class SettingsModel extends ISettings {
  factory SettingsModel.empty() => const SettingsModel(userId: '');

//<editor-fold desc="Data Methods">
  const SettingsModel({
    required super.userId,
    super.userName,
    super.userEmail,
    super.seller,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ISettings &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          userName == other.userName &&
          userEmail == other.userEmail &&
          seller == other.seller);

  @override
  int get hashCode => userId.hashCode ^ userName.hashCode ^ userEmail.hashCode ^ seller.hashCode;

  @override
  ISettings copyWith({
    String? userId,
    String? userName,
    String? userEmail,
    bool? seller,
  }) {
    return SettingsModel(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      seller: seller ?? this.seller,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userEmail': userEmail,
      'seller': seller,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
      userEmail: map['userEmail'] as String,
      seller: map['seller'] as bool,
    );
  }
//</editor-fold>
}
