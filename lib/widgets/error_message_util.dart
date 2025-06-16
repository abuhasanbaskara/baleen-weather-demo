class ErrorMessageUtil {

  static String getErrorTitle(String? code) {
    switch (code) {
      case '401':
        return 'Unauthorized';
      case '404':
        return 'City Not Found';
      case '500':
        return 'Internal Server Error';
      default:
        return 'Something went wrong. Please try again.';
    }
  }

  static String getErrorMessage(String? code) {
    switch (code) {
      case '401':
        return 'Please check your API key or login credentials.';
      case '404':
        return 'Try using a simpler city name (ex: Tokyo)';
      case '500':
        return 'Please try again later.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}