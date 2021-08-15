abstract class RegisterCallback {
  void onRegisterLoading();
  void onRegisterSuccess(String message, String status);
  void onRegisterFailed(int errorCode, String message);
}