/// Low-level exceptions thrown by data sources.
///
/// These must be converted to [Failure] instances in repositories.
class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}


