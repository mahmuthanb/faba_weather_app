import 'package:dio/dio.dart';
import 'package:faba_weather_app/core/constants/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Convert DioException into a user-friendly message
    final message = _handleError(err);
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.red,
      textColor: AppColors.white,
      fontAsset: 'Urbanist',
      fontSize: 16,
    );
    // Continue passing the error
    super.onError(err, handler);
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout";
      case DioExceptionType.sendTimeout:
        return "Send timeout";
      case DioExceptionType.receiveTimeout:
        return "Received timeout";
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final message = error.response?.data["message"];
        if (statusCode == 400) return message;
        if (statusCode == 401) return "Unauthorized access";
        if (statusCode == 404) return "Page not found";
        return "Server error: $statusCode";
      case DioExceptionType.cancel:
        return "Request cancelled";
      case DioExceptionType.connectionError:
        return "Internet connection not found";
      default:
        return "Unexpexted error";
    }
  }
}
