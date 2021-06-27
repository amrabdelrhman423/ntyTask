import 'package:dio/dio.dart';

//singleton class to share the same dio object for the whole app
class DioUtil {
  static DioUtil? _instance = DioUtil();
  static Dio? _dio;

  static DioUtil getInstance() {
    _dio = Dio(_getOptions());
    return _instance!;
  }

  static Dio get dio => _dio!;

  static void setDioAgain() {
    _dio = Dio(_getOptions());
  }

  static BaseOptions _getOptions() {
    BaseOptions options = BaseOptions(
      followRedirects: false,
      validateStatus: (status) => (status)! <= 500,
    );
    options.connectTimeout = 20 * 1000; //10 sec
    options.receiveTimeout = 20 * 1000; //20 sec
    options.baseUrl = "https://api.nytimes.com/";

    options.headers = {};

    return options;
  }

  //this just returns the language key
  static String handleDioError(dioError) {
    String errorDescription = "";
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = "request_cancelled";
        break;
      case DioErrorType.connectTimeout:
        //Connection timeout with API server
        errorDescription = "timeout";
        break;
      case DioErrorType.other:
        errorDescription = "checkout_internet";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "timeout";
        break;
      case DioErrorType.response:
        print("Received invalid status code: ${dioError.response!.statusCode}");
        errorDescription = "unknown_error";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "timeout";
        break;
    }
    return errorDescription;
  }
}
