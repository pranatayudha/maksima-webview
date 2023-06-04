// ignore_for_file: file_names

class EducationFormatter {
  static String convertToLongText(String education) {
    String? result;
    switch (education) {
      case 'BT':
        result = 'Belum Tamat SD / Sederajat';
        break;
      case 'D1':
        result = 'Diploma 1';
        break;
      case 'D2':
        result = 'Diploma 2';
        break;
      case 'D3':
        result = 'Diploma 3';
        break;
      case 'S1':
        result = 'Sarjana / Diploma IV';
        break;
      case 'S2':
        result = 'Master';
        break;
      case 'S3':
        result = 'Doktor';
        break;
      case 'SD':
        result = 'SD';
        break;
      case 'SM':
        result = 'SMP';
        break;
      case 'SU':
        result = 'SMU';
        break;
      case 'TS':
        result = 'Tidak / Belum Sekolah';
        break;
      default:
        result = 'Lainnya';
        break;
    }

    return result;
  }
}
