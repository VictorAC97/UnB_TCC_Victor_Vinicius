bool isInvalidDate(DateTime date) {
  bool answer;

  answer = date.year == DateTime.now().year &&
      date.month == DateTime.now().month &&
      date.day == DateTime.now().day;

  return answer;
}
