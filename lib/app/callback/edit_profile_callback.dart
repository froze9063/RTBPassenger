abstract class EditProfileCallback {
  void onEditProfileLoading();
  void onEditProfileSuccess(String message, String status);
  void onEditProfileFailed(int errorCode, String message);
}