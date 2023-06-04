class InitialCodeTableFormatter {
  static String getPrakarsaType(int codeTable) {
    switch (codeTable) {
      case 1:
        return 'pr';
      case 2:
        return 'cv';
      case 3:
        return 'pt';
      case 4:
        return 'pari';
      default:
        return 'pr';
    }
  }
}
