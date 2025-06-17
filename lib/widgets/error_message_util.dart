class ErrorMessageUtil {

  static String getErrorTitle(String? code) {
    switch (code) {
      case '401':
        return 'Unauthorized';
      case '404':
        return 'City Not Found';
      case '500':
        return 'Internal Server Error';
      case 'No internet connection':
        return 'No internet connection';
      default:
        return 'Something went wrong';
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
      case 'No internet connection':
        return 'Please check your internet connection';
      default:
        return 'Please try again.';
    }
  }
}