class Rating {
  bool positive;
  double accuracy;

  double getImpact() {
    int base = positive ? 1 : -1;
    return base * accuracy;
  }
}
