abstract class BookTripsCallback {
  void onBookTripsLoading();
  void onBookTripsSuccess(String message,String url, String status);
  void onBookTripsFailed(int errorCode, String message);
}