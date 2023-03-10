class DateTimeUtils {
  static Duration difference(DateTime pastDate) {
    return DateTime.now().difference(pastDate);
  }
}