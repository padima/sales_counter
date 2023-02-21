abstract class IDataBarcode {
  final String userId;
  final String userName;
  final String userEmail;

//<editor-fold desc="Data Methods">
  const IDataBarcode({
    required this.userId,
    required this.userName,
    required this.userEmail,
  });

  IDataBarcode copyWith({
    String? userId,
    String? userName,
    String? userEmail,
  });

  Map<String, dynamic> toMap();

//</editor-fold>
}
