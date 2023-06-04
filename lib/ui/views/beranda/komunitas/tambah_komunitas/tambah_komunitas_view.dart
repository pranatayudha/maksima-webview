import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../shared/back_button_and_title.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_textfield.dart';
import '../../../../shared/stripped_label.dart';
import 'tambah_komunitas_viewmodel.dart';

class TambahKomunitasView
    extends ViewModelBuilderWidget<TambahKomunitasViewModel> {
  const TambahKomunitasView({Key? key}) : super(key: key);

  @override
  TambahKomunitasViewModel viewModelBuilder(BuildContext context) =>
      TambahKomunitasViewModel();

  @override
  Widget builder(
    BuildContext context,
    TambahKomunitasViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const BackButtonAndTitle('Tambah Komunitas', centerTitle: true),
              const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 30),
                child: Text(
                  'Lengkapi semua informasi di bawah untuk melakukan penambahan komunitas',
                  style: TextStyle(fontSize: 16, height: 1.3),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListView(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        CustomTextField(
                          label: 'Nama Komunitas',
                          hintText: 'Masukkan nama komunitas',
                        ),
                        CustomTextField(
                          label: 'Jenis Pertanian/Perkebunan/Peternakan',
                          hintText: 'Masukkan jenis komoditas',
                          enabled: false,
                        ),
                      ],
                    ),
                    const StrippedLabel(label: 'Lokasi Kelompok'),
                    ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const CustomTextField(
                          label: 'Kota/Kabupaten',
                          hintText: 'Masukkan Kota/Kabupaten',
                          enabled: false,
                        ),
                        const CustomTextField(
                          label: 'Kecamatan',
                          hintText: 'Masukkan Kecamatan',
                          enabled: false,
                        ),
                        const CustomTextField(
                          label: 'Kelurahan/Desa',
                          hintText: 'Masukkan Kelurahan/Desa',
                          enabled: false,
                        ),
                        const CustomTextField(
                          label: 'Kode Pos',
                          hintText: 'Masukkan Kode Pos',
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: CustomButton(
                            label: 'Selesai',
                            // ignore: no-empty-block
                            onPressed: () {},
                            isBusy: viewModel.isBusy,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
