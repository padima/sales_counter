import 'package:flutter/widgets.dart';
import 'package:sales_counter/domain/entity/data/i_settings.dart';

@immutable
class SettingsModel extends ISettings {
  factory SettingsModel.empty() => const SettingsModel(userId: '');

  //<editor-fold desc="Data Methods">
  const SettingsModel({
    required super.userId,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is ISettings && runtimeType == other.runtimeType && userId == other.userId);

  @override
  int get hashCode => userId.hashCode;

  @override
  ISettings copyWith({
    String? userId,
  }) {
    return SettingsModel(
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
    };
  }

  factory SettingsModel.fromMap(Map<String, dynamic> map) {
    return SettingsModel(
      userId: map['userId'] as String,
    );
  }
//</editor-fold>
}
