List toGenericList<T>(List<T> original) {
  List newList = [];
  original.forEach((item) => newList.add(item));
  return newList;
}

List fromGenericList<T>(List original) {
  List<T> newList = [];
  original.forEach((item) => newList.add(item as T));
  return newList;
}
