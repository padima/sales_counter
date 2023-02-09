abstract class AppException extends FormatException {
  AppException(super.message);

  @override
  String toString() {
    if (message == '') {
      return runtimeType.toString();
    } else {
      return message;
    }
  }
}
