import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/stateful_appbar_elevation_aware.dart';
import 'syarat_ketentuan_viewmodel.dart';

class SyaratKetentuanView
    extends ViewModelBuilderWidget<SyaratKetentuanViewModel> {
  const SyaratKetentuanView({Key? key}) : super(key: key);

  @override
  SyaratKetentuanViewModel viewModelBuilder(BuildContext context) =>
      SyaratKetentuanViewModel();

  @override
  Widget builder(
    BuildContext context,
    SyaratKetentuanViewModel viewModel,
    Widget? child,
  ) {
    return StatefulAppBarElevationAware(
      appBarTitle: 'Syarat & Ketentuan',
      onLeadingPressed: viewModel.navigateBack,
      padding: EdgeInsets.all(16.w),
      children: [
        _buildItem(
          '1.',
          'PINANG Maksima merupakan produk Pinjaman Usaha Produktif dengan agunan yang dikelola oleh PT Bank Raya Indonesia, Tbk yang merupakan anggota grup usaha dari PT Bank Rakyat Indonesia (Persero) Tbk (BRI).',
        ),
        _buildItem(
          '2.',
          'PINANG Maksima merupakan produk Pinjaman Usaha Produktif yang berbeda dengan Pinjaman Online yang ditawarkan oleh Lembaga Financial Technology (Fintech), dimana perbedaan paling mendasar adalah Aplikasi PINANG Maksima digunakan untuk usaha produktif yang diprakarsai oleh tenaga pemasaran yang dikelola oleh Institusi Keuangan berupa Bank dalam negeri (dhi. Bank Raya Indonesia) yang telah terdaftar dan secara ketat diawasi oleh Otoritas Jasa Keuangan sehingga dari sisi keamanan data nasabah akan lebih terawasi dan terjaga dengan baik mengingat Perbankan merupakan institusi keuangan yang diawasi dan diatur secara ketat oleh Otoritas Jasa Keuangan.',
        ),
        _buildItem(
          '3.',
          'Pengguna aplikasi PINANG Maksima hanya dapat melakukan Seluruh proses prakarsa pinjaman dilakukan secara online melalui Aplikasi PINANG Maksima dapat diunduh melalui Play Store dan App Store.',
        ),
        _buildItem(
          '4.',
          'Pemrosesan pengajuan Pinjaman melalui Aplikasi PINANG Maksima akan diproses dengan memanfaatkan data kependudukan pengguna, riwayat pinjaman dan/atau keuangan pengguna.',
        ),
        _buildItem(
          '5.',
          'Pengguna dengan persetujuaannya dalam mengajukan Pinjaman melalui Aplikasi PINANG Maksima menyetujui untuk memberikan akses kepada Bank Raya Indonesia untuk memperoleh, menyimpan, mengelola dan/atau menggunakan data berupa data kependudukan, riwayat keuangan, riwayat pinjaman, data yang diisi oleh nasabah melalui aplikasi PINANG Maksima(swafoto, data diri, data kerabat, data keuangan) untuk keperluan pemrosesan dan pengelolaan pinjaman baik yang diajukan maupun yang telah disetujui.',
        ),
        _buildItem(
          '6.',
          'Pengguna mengetahui dan menyetujui bahwa dalam hal terjadi tunggakan atau gagal bayar atas pinjaman yang telah disetujui, pengguna mengetahui dan menyetujui segala upaya yang akan dilakukan oleh Bank dalam proses penagihan termasuk dalam hal ini penggunakan jasa pihak ketiga sesuai dengan proses yang diatur dalam ketentuan internal Bank tanpa mengesampingkan ketentuan Peraturan Perundang-undangan yang berlaku.',
        ),
        _buildItem(
          '7.',
          'Pengguna secara penuh bertanggungjawab atas penggunaan aplikasi PINANG Maksima sehingga secara sadar dan tanggung jawab dalam menjaga segala kerahasiaan informasi yang menyangkut dengan data pribadi pengguna, PIN, Kode Keamanan dan/atau data privasi lainnya yang terkait dengan akses keamanan pengguna kedalam aplikasi PINANG Maksima dan tidak secara lalai maupun sengaja untuk memberitahukannya dan/atau memberikannya kepada pihak lain termasuk dalam hal ini kepada pihak lainnya selain petugas atau pegawai Bank Raya Indonesia.',
        ),
        _buildItem(
          '8.',
          'Pengguna wajib membaca secara teliti dan sadar untuk membaca informasi ini dan syarat dan ketentuan penggunaan serta privasi aplikasi PINANG Maksima sebelum membuat keputusan untuk mengajukan proses pinjaman melalui aplikasi PINANG Maksima.',
        ),
      ],
    );
  }

  Widget _buildItem(String number, String text) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(number),
            SizedBox(width: 8.w),
            Expanded(child: Text(text)),
          ],
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
