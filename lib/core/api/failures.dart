class Failure {
  final int? statusCode;
  final String? statusMessage;

  const Failure({this.statusCode, this.statusMessage});
}


class Failures extends Failure {
  final List<String> messages;

  Failures({this.messages = const []});
}

class TooManyRequestsFailure extends Failure {
  TooManyRequestsFailure();
}

class NetworkFailure extends Failure {
  const NetworkFailure()
      : super(statusCode: 200, statusMessage: 'network-error');
}
