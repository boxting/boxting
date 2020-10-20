class BoxtingFailure implements Exception {
  final String message;
  final int statusCode;

  BoxtingFailure({this.message, this.statusCode});

  @override
  String toString() => 'Error $statusCode. $message.';
}
