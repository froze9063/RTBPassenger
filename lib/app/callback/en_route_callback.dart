abstract class EnRouteCallback {
  void onEnRouteLoading();
  void onEnRouteSuccess(String message, String status);
  void onEnRouteFailed(int errorCode, String message);
}