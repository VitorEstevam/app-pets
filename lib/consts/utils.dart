int compareDates(DateTime d1,d2){
  var _d1 = DateTime(d1.year, d1.month, d1.day);
  var _d2 = DateTime(d2.year, d2.month, d2.day);

  return _d1.compareTo(_d2);
}