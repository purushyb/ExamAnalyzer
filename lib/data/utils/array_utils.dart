class ArrayUtils {
  static int circularArrayIndex(int arrayLen, int accessIndex) {
    if (accessIndex < 0) return 0;
    return accessIndex % arrayLen;
  }
}
