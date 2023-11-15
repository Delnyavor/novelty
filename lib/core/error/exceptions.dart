class CacheException implements Exception {
  final String message;
  const CacheException({required this.message});

  @override
  String toString() {
    Object? message = this.message;
    return "$message";
  }
}
