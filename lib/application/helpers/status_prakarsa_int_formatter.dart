class StatusPrakarsaIntFormatter {
  static int toInt(String statusPrakarsa) {
    final String status = statusPrakarsa.split(' ')[0] == 'Revisi'
        ? statusPrakarsa.split(' ')[0]
        : statusPrakarsa;
    switch (status) {
      case 'Lengkapi Informasi Prakarsa':
        return 1;
      case 'Siap Dikirim ke Checker':
      case 'Revisi':
        return 2;
      case 'Dokumen dalam proses verifikasi & tandatangan':
        return 3;
      case 'PTK selesai ditandatangan':
        return 4;
      case 'Dokumen dalam proses akad kredit':
        return 5;
      case 'Dokumen dalam proses pembuatan fasilitas':
        return 6;
      default:
        return 7;
    }
  }
}
