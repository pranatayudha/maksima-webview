import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../application/app/app.locator.dart';
import 'komunitas_detail/komunitas_detail_view.dart';
import 'tambah_komunitas/tambah_komunitas_view.dart';

class KomunitasViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final List<Map<String, dynamic>> _communities = [
    {
      'nama': 'Adil Makmur',
      'komoditas': 'Jagung',
      'dalamRencanaKerja': 3,
      'jumlahAnggota': 5,
      'anggotas': [
        {'nama': 'Herman Saleh', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Agung Sutoyo', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Aji Pamungkas', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Nina Karina', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Sulistiyawati', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
      ],
    },
    {
      'nama': 'Bagus Jaya',
      'komoditas': 'Jagung',
      'dalamRencanaKerja': 0,
      'jumlahAnggota': 12,
      'anggotas': [
        {'nama': 'Anggota 1', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 2', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 3', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 4', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 5', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 6', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 7', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 8', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 9', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 10', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 11', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 12', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
      ],
    },
    {
      'nama': 'Bela Tani',
      'komoditas': 'Bawang Merah',
      'dalamRencanaKerja': 0,
      'jumlahAnggota': 25,
      'anggotas': [
        {'nama': 'Anggota 1', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 2', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 3', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 4', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 5', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 6', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 7', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 8', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 9', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 10', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 11', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 12', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 13', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 14', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 15', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 16', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 17', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 18', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 19', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 20', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 21', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 22', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 23', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 24', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 25', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
      ],
    },
    {
      'nama': 'Dawet Segar',
      'komoditas': 'Pala',
      'dalamRencanaKerja': 0,
      'jumlahAnggota': 8,
      'anggotas': [
        {'nama': 'Anggota 1', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 2', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 3', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 4', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 5', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 6', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 7', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 8', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
      ],
    },
    {
      'nama': 'Pasukan Tani',
      'komoditas': 'Kacang',
      'dalamRencanaKerja': 0,
      'jumlahAnggota': 15,
      'anggotas': [
        {'nama': 'Anggota 1', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 2', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 3', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 4', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 5', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 6', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 7', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 8', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 9', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 10', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 11', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 12', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 13', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 14', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
        {'nama': 'Anggota 15', 'nilaiPinjaman': 'Rp. 100.000.000,-'},
      ],
    },
  ];

  List<Map<String, dynamic>> get communities => _communities;

  int get totalAnggota => _totalAnggota();

  void navigateToTambahKomunitasView() =>
      _navigationService.navigateToView(const TambahKomunitasView());

  void navigateToKomunitasDetailView(Map<String, dynamic> komunitas) =>
      _navigationService.navigateToView(KomunitasDetailView(komunitas));

  int _totalAnggota() {
    int result = 0;

    _communities.forEach((community) {
      result += community['jumlahAnggota'] as int;
    });

    return result;
  }
}
