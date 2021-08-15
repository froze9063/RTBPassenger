abstract class UploadPhotoCallback {
  void onUploadPhotoLoading();
  void onUploadPhotoSuccess(String message, String status);
  void onUploadPhotoFailed(int errorCode, String message);
}