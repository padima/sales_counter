import 'package:flutter/widgets.dart';

@immutable
abstract class ISettings {
  final String userId;
  final String userName;
  final String userEmail;
  final bool seller;

  const ISettings({
    required this.userId,
    this.userName = '',
    this.userEmail = '',
    this.seller = false,
  });

  Map<String, dynamic> toMap();

  ISettings copyWith({
    String? userId,
    String? userName,
    String? userEmail,
    bool? seller,
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
}
