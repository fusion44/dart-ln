class ConnectionError extends Error {
  final String message;
  final String osError;
  ConnectionError(this.message, {this.osError = ''});
}
