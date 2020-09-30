class AppUtils {
  static String completeNumber(numberToComplete) {
    return numberToComplete < 10 ? "0$numberToComplete" : "$numberToComplete";
  }

  static String formatDate(dateToFormat) {
    try {
      final date = DateTime.parse(dateToFormat);
      return "${completeNumber(date.day)}/${completeNumber(date.month)}/${date.year}";
    } catch (e) {
      return "";
    }
  }
}
