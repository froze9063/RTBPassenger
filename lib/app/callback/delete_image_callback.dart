abstract class RemoveImageCallback {
  void onRemoveImageLoading();
  void onRemoveImageSuccess(String message, String status);
  void onRemoveImageFailed(int errorCode, String message);
}