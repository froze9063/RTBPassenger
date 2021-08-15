abstract class LoginCallback {
  void onLoginLoading();
  void onLoginSuccess(String message, String status);
  void onLoginFailed(int errorCode, String message);
}