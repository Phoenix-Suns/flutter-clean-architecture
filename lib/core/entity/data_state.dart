
class DataState<T> {
  T? data;
  ErrorInfo? errorInfo;
  int? statusCode;

  static DataState<T> success<T>(T data, int? statusCode) {
    var dataState = DataState<T>();
    dataState.data = data;
    dataState.statusCode = statusCode;
    return dataState;
  }

  static DataState<T> apiError<T>(String? message, int? statusCode) {
    var dataState = DataState<T>();
    dataState.statusCode = statusCode;
    dataState.errorInfo = ErrorInfo(errorType: ErrorType.API, message: message);
    return dataState;
  }

  static DataState<T> cacheError<T>(String? message) {
    var dataState = DataState<T>();
    dataState.errorInfo = ErrorInfo(errorType: ErrorType.CACHE, message: message);
    return dataState;
  }

  static DataState<T> networkConnectionError<T>(String? message) {
    var dataState = DataState<T>();
    dataState.errorInfo = ErrorInfo(errorType: ErrorType.NETWORK_CONNECTION, message: message);
    return dataState;
  }

  static DataState<T> unexpectedError<T>(String? message) {
    var dataState = DataState<T>();
    dataState.errorInfo = ErrorInfo(errorType: ErrorType.UNEXPECTED, message: message);
    return dataState;
  }
}

class ErrorInfo {
  ErrorType? errorType;
  String? message;

  ErrorInfo({ required this.errorType, required this.message});
}

enum ErrorType {
  API,
  CACHE,
  NETWORK_CONNECTION,
  UNEXPECTED
}