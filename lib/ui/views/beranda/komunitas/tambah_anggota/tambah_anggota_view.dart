import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../application/app/constants/icon_constants.dart';
import '../../../../shared/back_button_and_title.dart';
import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_textfield.dart';
import 'tambah_anggota_viewmodel.dart';

class TambahAnggotaView extends ViewModelBuilderWidget<TambahAnggotaViewModel> {
  const TambahAnggotaView({Key? key}) : super(key: key);

  @override
  TambahAnggotaViewModel viewModelBuilder(BuildContext context) =>
      TambahAnggotaViewModel();

  @override
  Widget builder(
    BuildContext context,
    TambahAnggotaViewModel viewModel,
    Widget? child,
  ) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const BackButtonAndTitle('Informasi Data Diri Nasabah'),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 30),
                child: Text(
                  'Lengkapi semua informasi di bawah untuk melakukan prakarsa. Pastikan seluruh data terisi dengan benar.',
                  style: TextStyle(fontSize: 16, height: 1.3),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  children: [
                    const CustomTextField(
                      label: 'NIK Nasabah',
                      hintText: 'Masukkan NIK Nasabah',
                    ),
                    const CustomTextField(
                      label: 'Nama Lengkap Nasabah Sesuai KTP',
                      hintText: 'Masukkan Nama Lengkap Nasabah',
                    ),
                    const CustomTextField(
                      label: 'Jenis Keanggotaan',
                      hintText: 'Pilih Jenis Keanggotaan',
                      enabled: false,
                    ),
                    const CustomTextField(
                      label: 'Tanggal Lahir Nasabah',
                      hintText: 'DD/MM/YYYY',
                      withSuffixIcon: true,
                      suffixIconImagePath: IconConstants.calendar,
                    ),
                    const CustomTextField(
                      label: 'No. Handphone',
                      hintText: 'Masukkan No. HP Nasabah',
                    ),
                    const CustomTextField(
                      label: 'Alamat Tempat Tinggal',
                      hintText: 'Masukkan Alamat Nasabah',
                      withSuffixIcon: true,
                      suffixIconImagePath: IconConstants.location,
                    ),
                    const CustomTextField(
                      label: 'Detail Alamat Tempat Tinggal',
                      hintText: 'cth. Blok A, No.10',
                    ),
                    const CustomTextField(
                      label: 'Kode Pos',
                      hintText: 'Input Kode Pos',
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: CustomTextField(
                            label: 'Kecamatan',
                            hintText: 'Pilih Kecamatan',
                            withSuffixIcon: true,
                            suffixIconImagePath: IconConstants.chevronDown,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: CustomTextField(
                            label: 'Kelurahan',
                            hintText: 'Pilih Kelurahan',
                            withSuffixIcon: true,
                            suffixIconImagePath: IconConstants.chevronDown,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: CustomTextField(
                            label: 'RT',
                            hintText: 'cth. 005',
                            withSuffixIcon: true,
                            suffixIconImagePath: IconConstants.chevronDown,
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: CustomTextField(
                            label: 'RW',
                            hintText: 'cth. 005',
                            withSuffixIcon: true,
                            suffixIconImagePath: IconConstants.chevronDown,
                          ),
                        ),
                      ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
