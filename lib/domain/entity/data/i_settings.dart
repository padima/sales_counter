import 'package:flutter/widgets.dart';

@immutable
abstract class ISettings {
  final String userId;
  final String? userName;
  final String? userEmail;
  final bool seller;

  const ISettings({
    required this.userId,
    this.userName,
    this.userEmail,
    this.seller = false,
  });

  Map<String, dynamic> toMap();

  ISettings copyWith({
    String? userId,
    String? userName,
    String? userEmail,
    bool? seller,
  });
}
