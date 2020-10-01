class AppUtils {
  static String completeNumber(numberToComplete) {
    return numberToComplete < 10 ? "0$numberToComplete" : "$numberToComplete";
  }

  static String formatDate(String dateToFormat) {
    try {
      if (dateToFormat.endsWith("Y")) {
        return dateToFormat.split("Y")[0];
      }
      final date = DateTime.parse(dateToFormat);
      return "${completeNumber(date.day)}/${completeNumber(date.month)}/${date.year}";
    } catch (e) {
      return "";
    }
  }
}
