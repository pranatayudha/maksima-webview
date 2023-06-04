import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../shared/stateful_appbar_elevation_aware.dart';
import 'kebijakan_privasi_viewmodel.dart';

class KebijakanPrivasiView
    extends ViewModelBuilderWidget<KebijakanPrivasiViewModel> {
  const KebijakanPrivasiView({Key? key}) : super(key: key);

  @override
  KebijakanPrivasiViewModel viewModelBuilder(BuildContext context) =>
      KebijakanPrivasiViewModel();

  @override
  Widget builder(
    BuildContext context,
    KebijakanPrivasiViewModel viewModel,
    Widget? child,
  ) {
    return StatefulAppBarElevationAware(
      appBarTitle: 'Kebijakan Privasi',
      onLeadingPressed: viewModel.navigateBack,
      padding: EdgeInsets.all(16.w),
      children: [
        const Text(
          'Pinang Maksima berkomitmen terhadap privasi Anda. \n\nPinang Maksima akan menginformasikan tentang hal-hal penting mengenai Kebijakan Privasi Data Pribadi Pengguna. Perlu diperhatikan, dengan mendaftar dan/atau menggunakan Pinang Maksima, Pengguna mengakui secara sadar bahwa Pengguna telah membaca serta menyetujui atas pengumpulan, penyimpanan, perekaman, pengolahan dan penganalisaan, pengiriman Data Pribadi sesuai dengan Kebijakan Privasi ini dan/atau Syarat Penggunaan. \n\nPinang Maksima menyadari bahwa terdapat informasi dan/atau data Pengguna yang bersifat rahasia dan pribadi. Oleh karena itu Pinang Maksima berkomitmen untuk melindungi dan merahasiakan Data Pribadi sesuai dengan peraturan perundang- undangan Republik Indonesia. \n\nKebijakan Kerahasiaan Pinang Maksima meliputi: \n',
        ),
        _buildItem(
          '1.',
          'DEFINISI \n\n1.1. PINANG Maksima merupakan produk Pinjaman Usaha Produktif dengan agunan yang dikelola oleh PT Bank Raya Indonesia, Tbk yang merupakan anggota grup usaha dari PT Bank Rakyat Indonesia (Persero) Tbk (BRI). \n\n1.2. PINANG Maksima merupakan produk Pinjaman Usaha Produktif yang berbeda dengan Pinjaman Online yang ditawarkan oleh Lembaga Financial Technology (Fintech), dimana perbedaan paling mendasar adalah Aplikasi PINANG Maksima digunakan untuk usaha produktif yang diprakarsai oleh tenaga pemasaran yang dikelola oleh Institusi Keuangan berupa Bank dalam negeri (dhi. Bank Raya Indonesia) yang telah terdaftar dan secara ketat diawasi oleh Otoritas Jasa Keuangan sehingga dari sisi keamanan data nasabah akan lebih terawasi dan terjaga dengan baik mengingat Perbankan merupakan institusi keuangan yang diawasi dan diatur secara ketat oleh Otoritas Jasa Keuangan.\n',
        ),
        _buildItem(
          '2.',
          'PENGUMPULAN INFORMASI PRIBADI \nKami mengumpulkan Informasi Pribadi mengenai Anda sebagai Pengguna saat mengakses atau menggunakan aplikasi mengacu sesuai dengan ketentuan POJK No.1/POJK.07/2013 tentang Perlindungan Konsumen Sektor Jasa Keuangan. Kami juga mengumpulkan informasi tidak langsung yang tidak dapat diidentifikasi secara pribadi yang mungkin terkait dengan Anda selaku Pengguna, termasuk nama keanggotaan, alamat IP dan informasi login, akses ke kamera yang digunakan untuk mengidentifikasi Pengguna, akses ke GPS untuk dapat memberikan info posisi Pengguna, serta hal-hal lain termasuk preferensi pencapaian dan demografi. Informasi pribadi Anda hanya digunakan untuk kepentingan yang terkait yang telah disetujui oleh Pengguna.\n',
        ),
        _buildItem(
          '3.',
          'PENGGUNAAN DAN PEMBAGIAN INFORMASI PRIBADI \nDalam penggunaan Anda sebagai Pengguna Terdaftar, Kami akan mengumpulkan beberapa Informasi Pribadi sebagai identifikasi pengajuan pinjaman Anda. Informasi pribadi tersebut juga mungkin akan Kami sampaikan kepada Pihak Ketiga dalam hal pemrosesan kegiatan yang berhubungan dengan pengajuan Anda terhadap suatu produk atau layanan tertentu. Dengan Anda telah memberikan Informasi Pribadi, berarti Anda memahami dan menyetujui bahwa Anda melakukan pengajuan atas diri pribadi dan tanpa ada paksaan ataupun tekanan dari pihak manapun, dan hanya digunakan untuk kepentingan tersebut di atas. \n\nSelain hal tersebut diatas, Kami juga menggunakan Informasi Pribadi dalam kapasitas Kami sebagai pemberi layanan kepada Anda untuk hal sebagai berikut: \n\n3.1.Memungkinkan Anda untuk dapat mengakses dan mendapatkan informasi diri,  finansial dan/atau keuangan, secara tersistem sehingga memperoleh hasil data tersebut secara cepat. \n\n3.2.Memungkinkan Kami untuk dapat menyampaikan informasi mengenai rilis produk terbaru, atau layanan mendatang yang akan Kami sampaikan di aplikasi. \n\n3.3.Memungkinkan Pihak Ketiga untuk membantu Anda dalam mengidentifikasi dan mengolah informasi diri maupun finasial pada saat Anda mengirimkan Informasi tersebut pada aplikasi. \n\n3.4.Memproses dan /atau menganalisa data yang diinput oleh Anda sebagai bentuk verifikasi dan data pendukung dalam membuat keputusan. \n',
        ),
        _buildItem(
          '4.',
          'KEAMANAN INFORMASI PRIBADI \nKami akan menyimpan Informasi Data Diri secara rahasia dan tidak membuka atau memberikan informasi tersebut kepada atau memungkinkan akses oleh pihak lain, selain pihak berikut: \n\n4.1. Perusahaan terkait. \n\n4.2. Pihak Ketiga, dimana Pihak Ketiga ini bertindak sebagai pengolah  dan / atau pengendali informasi data Anda sehingga Anda harus membaca Kebijakan Privasi mereka atau menghubungi mereka secara langsung untuk informasi tambahan. \n\n4.3. Lembaga Pemerintahan terkait, dalam rangka untuk mencegah penipuan dan pencucian uang, dalam kasus bahwa data palsu atau tidak tepat dan/atau diduga kasus penipuan, yang diatur sesuai dengan ketentuan peraturan perundang-undangan. \n\nDalam keadaan tertentu dan luar biasa, Kami mungkin diperlukan untuk mengungkapkan Informasi Pribadi. Kami berkomitmen untuk mematuhi sesuai dengan hukum atau perintah pengadilan, atau dalam menanggapi permintaan yang sah oleh Pemerintah atau Penegak Hukum, atau dalam hal Kami percaya dengan itikad baik bahwa pengungkapan diperlukan, termasuk namun tidak terbatas pada perlindungan hak atau properti Kami, atau untuk mengidentifikasi, mengontak dan melaksanakan tindakan hukum terhadap setiap pihak yang mungkin bisa menyebabkan kerusakan atau gangguan hak-hak Kami atau properti (baik sengaja atau tidak), atau ketika orang lain dapat dirugikan oleh kegiatan tersebut. \n',
        ),
        _buildItem(
          '5.',
          'UMUM \n5.1. Penggunaan dan akses ke Situs ini diatur oleh Syarat dan Ketentuan serta Kebijakan Privasi Kami. Dengan mengakses atau menggunakan Situs ini, informasi, atau aplikasi lainnya dalam bentuk aplikasi mobile yang disediakan, berarti Anda telah memahami dan menyetujui serta terikat dan tunduk dengan segala Syarat dan ketentuan yang berlaku. \n\n5.2. Kami berhak untuk menutup atau mengubah atau memperbaharui Kebijakan Privasi ini setiap saat tanpa pemberitahuan, dan berhak untuk membuat keputusan akhir jika tidak ada ketidakcocokan. Kami tidak bertanggung jawab atas kerugian dalam bentuk apapun yang timbul akibat perubahan pada Kebijakan Privasi. Pengguna dengan ini membebaskan Kami dari tanggungjawab atas tidak tersampaikannya data/ informasi yang disampaikan kepada Pengguna melalui berbagai jenis saluran komunikasi karena faktor kesalahan teknis yang tidak diduga-duga sebelumnya. \n\n5.3. Jika Anda masih memerlukan jawaban atas pertanyaan yang tidak terdapat dalam Kebijakan Privasi ini, Anda dapat menghubungi Kami di Hotline Call Centre 1500 494 \n',
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
