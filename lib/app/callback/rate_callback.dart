abstract class RateCallback {
  void onRateLoading();
  void onRateSuccess(String message, String status);
  void onRateFailed(int errorCode, String message);
}