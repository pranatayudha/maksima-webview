// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:file_picker/file_picker.dart' as _i145;
import 'package:flutter/foundation.dart' as _i118;
import 'package:flutter/material.dart';
import 'package:pinang_maksima_web/application/enums/status_kelolaan_type.dart'
    as _i119;
import 'package:pinang_maksima_web/application/models/monitoring_pinjaman_detail.dart'
    as _i120;
import 'package:pinang_maksima_web/application/models/ritel_informasi_agunan_tambahan_detail_cash_coll.dart'
    as _i138;
import 'package:pinang_maksima_web/application/models/ritel_informasi_agunan_tambahan_detail_mesin.dart'
    as _i139;
import 'package:pinang_maksima_web/application/models/ritel_informasi_agunan_tambahan_detail_motor.dart'
    as _i137;
import 'package:pinang_maksima_web/application/models/ritel_informasi_agunan_tambahan_detail_tanah.dart'
    as _i135;
import 'package:pinang_maksima_web/application/models/ritel_informasi_agunan_tambahan_detail_tanah_bangunan.dart'
    as _i136;
import 'package:pinang_maksima_web/application/models/ritel_informasi_data_diri.dart'
    as _i121;
import 'package:pinang_maksima_web/application/models/ritel_informasi_lainnya.dart'
    as _i123;
import 'package:pinang_maksima_web/application/models/ritel_informasi_lainnya_cv.dart'
    as _i129;
import 'package:pinang_maksima_web/application/models/ritel_informasi_lainnya_pt.dart'
    as _i126;
import 'package:pinang_maksima_web/application/models/ritel_informasi_perusahaan_cv.dart'
    as _i127;
import 'package:pinang_maksima_web/application/models/ritel_informasi_perusahaan_pt.dart'
    as _i124;
import 'package:pinang_maksima_web/application/models/ritel_informasi_pinjaman.dart'
    as _i141;
import 'package:pinang_maksima_web/application/models/ritel_informasi_usaha.dart'
    as _i122;
import 'package:pinang_maksima_web/application/models/ritel_laporan_kunjungan_nasabah.dart'
    as _i140;
import 'package:pinang_maksima_web/application/models/ritel_legalitas_usaha_lainnya.dart'
    as _i132;
import 'package:pinang_maksima_web/application/models/ritel_legalitas_usaha_utama.dart'
    as _i131;
import 'package:pinang_maksima_web/application/models/ritel_list_informasi_pengurus_pemilik_cv.dart'
    as _i128;
import 'package:pinang_maksima_web/application/models/ritel_list_informasi_pengurus_pemilik_pt.dart'
    as _i125;
import 'package:pinang_maksima_web/application/models/ritel_mutasi_rekening.dart'
    as _i133;
import 'package:pinang_maksima_web/application/models/ritel_mutasi_transaksi_pari.dart'
    as _i144;
import 'package:pinang_maksima_web/application/models/ritel_prakarsa_perorangan.dart'
    as _i130;
import 'package:pinang_maksima_web/application/models/ritel_riwayat_projek.dart'
    as _i142;
import 'package:pinang_maksima_web/application/models/ritel_summary_non_finansial.dart'
    as _i134;
import 'package:pinang_maksima_web/application/models/ritel_trade_checking.dart'
    as _i143;
import 'package:pinang_maksima_web/application/models/RitelMutasiRekeningHeader.dart'
    as _i146;
import 'package:pinang_maksima_web/ui/shared/guided_camera_view.dart' as _i12;
import 'package:pinang_maksima_web/ui/shared/no_network.dart' as _i11;
import 'package:pinang_maksima_web/ui/shared/server_maintenance.dart' as _i10;
import 'package:pinang_maksima_web/ui/views/address_selection/address_selection_view.dart'
    as _i8;
import 'package:pinang_maksima_web/ui/views/akun/akun_view.dart' as _i9;
import 'package:pinang_maksima_web/ui/views/akun/bantuan/bantuan_view.dart'
    as _i14;
import 'package:pinang_maksima_web/ui/views/akun/informasi_pribadi/informasi_pribadi_view.dart'
    as _i13;
import 'package:pinang_maksima_web/ui/views/akun/kebijakan_privasi/kebijakan_privasi_view.dart'
    as _i16;
import 'package:pinang_maksima_web/ui/views/akun/syarat_ketentuan/syarat_ketentuan_view.dart'
    as _i15;
import 'package:pinang_maksima_web/ui/views/beranda/beranda_view.dart' as _i5;
import 'package:pinang_maksima_web/ui/views/beranda/monitoring/monitoring_detail/monitoring_detail_view.dart'
    as _i113;
import 'package:pinang_maksima_web/ui/views/beranda/monitoring/monitoring_view.dart'
    as _i112;
import 'package:pinang_maksima_web/ui/views/beranda/monitoring/penurunan_pinjaman/penurunan_pinjaman_success_view.dart'
    as _i117;
import 'package:pinang_maksima_web/ui/views/beranda/monitoring/penurunan_pinjaman/penurunan_pinjaman_view.dart'
    as _i116;
import 'package:pinang_maksima_web/ui/views/beranda/monitoring/pinjaman_detail/pinjaman_detail_view.dart'
    as _i115;
import 'package:pinang_maksima_web/ui/views/beranda/monitoring/tambah_pencairan/tambah_pencairan_view.dart'
    as _i114;
import 'package:pinang_maksima_web/ui/views/beranda/ndp/hasil_prescreening/hasil_prescreening_view_cv_ritel.dart'
    as _i32;
import 'package:pinang_maksima_web/ui/views/beranda/ndp/hasil_prescreening/hasil_prescreening_view_ritel.dart'
    as _i53;
import 'package:pinang_maksima_web/ui/views/beranda/partnership/partnership_view_ritel.dart'
    as _i18;
import 'package:pinang_maksima_web/ui/views/beranda/partnership/tambah_partnership/tambah_partnership_view_ritel.dart'
    as _i19;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/prakarsa_details_view_ritel.dart'
    as _i40;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/hasil_analisa_pinjaman/hasil_analisa_pinjaman_success_view.dart'
    as _i81;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/hasil_analisa_pinjaman/hasil_analisa_pinjaman_view.dart'
    as _i80;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_lkn/informasi_agunan_lkn_form.dart'
    as _i71;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_lkn/informasi_agunan_lkn_view.dart'
    as _i69;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_lkn/widgets/informasi_agunan_lkn_details.dart'
    as _i70;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_tambahan/informasi_agunan_tambahan_details_cash_coll.dart'
    as _i67;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_tambahan/informasi_agunan_tambahan_details_mesin.dart'
    as _i68;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_tambahan/informasi_agunan_tambahan_details_motor.dart'
    as _i66;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_tambahan/informasi_agunan_tambahan_details_tanah.dart'
    as _i64;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_tambahan/informasi_agunan_tambahan_details_tanah_bangunan.dart'
    as _i65;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_tambahan/informasi_agunan_tambahan_view.dart'
    as _i63;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan/informasi_agunan_view_ritel.dart'
    as _i62;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan_pari/informasi_agunan_lkn_pari/widgets/informasi_agunan_lkn_details_pari.dart'
    as _i95;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan_pari/informasi_agunan_tambahan_pari/informasi_agunan_tambahan_details_cash_coll_pari.dart'
    as _i93;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan_pari/informasi_agunan_tambahan_pari/informasi_agunan_tambahan_details_mesin_pari.dart'
    as _i94;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan_pari/informasi_agunan_tambahan_pari/informasi_agunan_tambahan_details_motor_pari.dart'
    as _i92;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan_pari/informasi_agunan_tambahan_pari/informasi_agunan_tambahan_details_tanah_bangunan_pari.dart'
    as _i91;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan_pari/informasi_agunan_tambahan_pari/informasi_agunan_tambahan_details_tanah_pari.dart'
    as _i90;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan_pari/informasi_agunan_tambahan_pari/informasi_agunan_tambahan_view_pari.dart'
    as _i89;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_agunan_pari/informasi_agunan_view_pari.dart'
    as _i88;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_debitur/informasi_debitur_view.dart'
    as _i41;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_debitur_pari/informasi_debitur_pari_view.dart'
    as _i100;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial/data_laporan_finansial/screen/informasi_finansial_form_period1.dart'
    as _i56;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial/data_laporan_finansial/screen/informasi_finansial_view_period1.dart'
    as _i55;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial/informasi_finansial_view.dart'
    as _i54;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial/mutasi_rekening/mutasi_rekening_form_view.dart'
    as _i58;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial/mutasi_rekening/mutasi_rekening_view.dart'
    as _i57;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial/mutasi_rekening/widgets/mutasi_rekening_details.dart'
    as _i59;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial/riwayat_projek/riwayat_projek_details.dart'
    as _i77;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial/riwayat_projek/riwayat_projek_view.dart'
    as _i74;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial_pari/data_laporan_finansial/screen/informasi_finansial_form_period_pari.dart'
    as _i105;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial_pari/informasi_finansial_view_pari.dart'
    as _i101;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial_pari/mutasi_rekening/mutasi_rekening_pari_form_view.dart'
    as _i109;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial_pari/mutasi_rekening/mutasi_rekening_pari_view.dart'
    as _i108;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial_pari/mutasi_rekening/widgets/mutasi_rekening_details.dart'
    as _i110;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial_pari/mutasi_rekening/widgets/mutasi_rekening_details_item.dart'
    as _i111;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial_pari/mutasi_transaksi/mutasi_transaksi_detail.dart'
    as _i107;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_finansial_pari/mutasi_transaksi/mutasi_transaksi_view.dart'
    as _i106;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_non_finansial/summary_informasi_non_finansial.dart'
    as _i61;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_non_finansial/widgets/informasi_non_finansial_page_1_A.dart'
    as _i60;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_non_finansial_pari/summary_informasi_non_finansial_pari.dart'
    as _i97;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_non_finansial_pari/widgets/informasi_non_finansial_page_1_A_pari.dart'
    as _i96;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_pengurus/informasi_pengurus_view.dart'
    as _i43;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_perusahaan/informasi_perusahaan_view.dart'
    as _i42;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_pinjaman/informasi_pinjaman_view_pari.dart'
    as _i98;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_pinjaman/informasi_pinjaman_view_ritel.dart'
    as _i72;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_pinjaman/pinang_maxima_pari/widgets/informasi_pinjaman_details_pari.dart'
    as _i99;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/informasi_pinjaman/pinang_maxima_ritel/widgets/informasi_pinjaman_details_ritel.dart'
    as _i73;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha/legalitas_usaha_view.dart'
    as _i44;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha/tambah_dokumen_view.dart'
    as _i47;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha/update_dokumen_view.dart'
    as _i48;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha_pari/legalitas_usaha_pari_view.dart'
    as _i102;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha_pari/tambah_dokumen_pari_view.dart'
    as _i103;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha_pari/update_dokumen_pari_view.dart'
    as _i104;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha_perusahaan/cv/legalitas_usaha_perusahaan_cv_view.dart'
    as _i46;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha_perusahaan/cv/tambah_dokumen_perusahaan_cv_view.dart'
    as _i51;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha_perusahaan/cv/update_dokumen_perusahaan_cv_view.dart'
    as _i52;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha_perusahaan/pt/legalitas_usaha_perusahaan_pt_view.dart'
    as _i45;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha_perusahaan/pt/tambah_dokumen_perusahaan_pt_view.dart'
    as _i49;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/legalitas_usaha_perusahaan/pt/update_dokumen_perusahaan_pt_view.dart'
    as _i50;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/trade_checking/trade_checking_details.dart'
    as _i76;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/trade_checking/trade_checking_view.dart'
    as _i75;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/upload_crr/upload_crr_view.dart'
    as _i78;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_details_ritel/tabs/informasi_prakarsa/upload_crr/widgets/upload_crr_details.dart'
    as _i79;
import 'package:pinang_maksima_web/ui/views/beranda/prakarsa/prakarsa_view.dart'
    as _i7;
import 'package:pinang_maksima_web/ui/views/beranda/widgets/stats_cards/widgets/status_kelolaan_item_details_view.dart'
    as _i17;
import 'package:pinang_maksima_web/ui/views/login/login_view.dart' as _i3;
import 'package:pinang_maksima_web/ui/views/main/main_view.dart' as _i4;
import 'package:pinang_maksima_web/ui/views/pipeline/pipeline_details/pipeline_details_cv_view_ritel.dart'
    as _i37;
import 'package:pinang_maksima_web/ui/views/pipeline/pipeline_details/pipeline_details_pt_view_ritel.dart'
    as _i30;
import 'package:pinang_maksima_web/ui/views/pipeline/pipeline_details/pipeline_details_view_ritel.dart'
    as _i25;
import 'package:pinang_maksima_web/ui/views/pipeline/pipeline_details_pari/pipeline_details_view_pari.dart'
    as _i86;
import 'package:pinang_maksima_web/ui/views/pipeline/pipeline_view.dart' as _i6;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_pari/perorangan_pari/informasi_data_diri_pari/informasi_data_diri_view_pari.dart'
    as _i83;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_pari/perorangan_pari/informasi_lainnya_pari/informasi_lainnya_pari_view.dart'
    as _i85;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_pari/perorangan_pari/informasi_usaha_debitur_pari/informasi_usaha_debitur_pari_view.dart'
    as _i84;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_pari/perorangan_pari/tdp_perorangan_view_pari.dart'
    as _i82;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perorangan/informasi_data_diri/informasi_data_diri_view.dart'
    as _i22;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perorangan/informasi_lainnya/informasi_lainnya_view.dart'
    as _i24;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perorangan/informasi_usaha_debitur/informasi_usaha_debitur_view.dart'
    as _i23;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perorangan/tdp_perorangan_view_ritel.dart'
    as _i21;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_cv/informasi_lainnya_cv/informasi_lainnya_view.dart'
    as _i36;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_cv/informasi_pengurus_cv/informasi_pengurus_cv_board_view.dart'
    as _i39;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_cv/informasi_pengurus_cv/informasi_pengurus_cv_view.dart'
    as _i35;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_cv/informasi_perusahaan_cv/informasi_perusahaan_cv_view.dart'
    as _i34;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_cv/tdp_perusahaan_cv_view_ritel.dart'
    as _i33;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_pt/informasi_lainnya_pt/informasi_lainnya_pt_view.dart'
    as _i29;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_pt/informasi_pengurus_pt/informasi_pengurus_pt_board_view.dart'
    as _i31;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_pt/informasi_pengurus_pt/informasi_pengurus_pt_view.dart'
    as _i28;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_pt/informasi_perusahaan_pt/informasi_perusahaan_pt_view.dart'
    as _i27;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/perusahaan_pt/tdp_perusahaan_pt_view_ritel.dart'
    as _i26;
import 'package:pinang_maksima_web/ui/views/pipeline/tambah_debitur_potensial_ritel/tdp_view_ritel.dart'
    as _i20;
import 'package:pinang_maksima_web/ui/views/pipeline/widgets/pipeline_success_view_pari.dart'
    as _i87;
import 'package:pinang_maksima_web/ui/views/pipeline/widgets/pipeline_success_view_ritel.dart'
    as _i38;
import 'package:pinang_maksima_web/ui/views/startup/startup_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i147;

class Routes {
  static const startupView = '/';

  static const loginView = '/login-view';

  static const mainView = '/main-view';

  static const berandaView = '/beranda-view';

  static const pipelineView = '/pipeline-view';

  static const prakarsaView = '/prakarsa-view';

  static const addressSelectionView = '/address-selection-view';

  static const akunView = '/akun-view';

  static const serverMaintenance = '/server-maintenance';

  static const noNetwork = '/no-network';

  static const guidedCameraView = '/guided-camera-view';

  static const informasiPribadiView = '/informasi-pribadi-view';

  static const bantuanView = '/bantuan-view';

  static const syaratKetentuanView = '/syarat-ketentuan-view';

  static const kebijakanPrivasiView = '/kebijakan-privasi-view';

  static const statusKelolaanItemDetailsView =
      '/status-kelolaan-item-details-view';

  static const partnershipViewRitel = '/partnership-view-ritel';

  static const tambahPartnershipViewRitel = '/tambah-partnership-view-ritel';

  static const tDPViewRitel = '/t-dp-view-ritel';

  static const tDPPeroranganViewRitel = '/t-dp-perorangan-view-ritel';

  static const informasiDataDiriView = '/informasi-data-diri-view';

  static const informasiUsahaDebiturView = '/informasi-usaha-debitur-view';

  static const informasiLainnyaView = '/informasi-lainnya-view';

  static const pipelineDetailsViewRitel = '/pipeline-details-view-ritel';

  static const tDPPerusahaanPtViewRitel = '/t-dp-perusahaan-pt-view-ritel';

  static const informasiPerusahaanPtView = '/informasi-perusahaan-pt-view';

  static const informasiPengurusPtView = '/informasi-pengurus-pt-view';

  static const informasiLainnyaPtView = '/informasi-lainnya-pt-view';

  static const pipelineDetailsPtViewRitel = '/pipeline-details-pt-view-ritel';

  static const informasiPengurusPemilikBoardView =
      '/informasi-pengurus-pemilik-board-view';

  static const hasilPrescreeningViewPerusahaanCVRitel =
      '/hasil-prescreening-view-perusahaan-cv-ritel';

  static const tDPPerusahaanCvViewRitel = '/t-dp-perusahaan-cv-view-ritel';

  static const informasiPerusahaanCvView = '/informasi-perusahaan-cv-view';

  static const informasiPengurusCvView = '/informasi-pengurus-cv-view';

  static const informasiLainnyaCvView = '/informasi-lainnya-cv-view';

  static const pipelineDetailsCvViewRitel = '/pipeline-details-cv-view-ritel';

  static const pipelineSuccessViewRitel = '/pipeline-success-view-ritel';

  static const informasiPengurusPemilikBoardCvView =
      '/informasi-pengurus-pemilik-board-cv-view';

  static const prakarsaDetailsViewRitel = '/prakarsa-details-view-ritel';

  static const informasiDebiturView = '/informasi-debitur-view';

  static const informasiPerusahaanView = '/informasi-perusahaan-view';

  static const informasiPengurusView = '/informasi-pengurus-view';

  static const legalitasUsahaView = '/legalitas-usaha-view';

  static const legalitasUsahaPerusahaanPtView =
      '/legalitas-usaha-perusahaan-pt-view';

  static const legalitasUsahaPerusahaanCvView =
      '/legalitas-usaha-perusahaan-cv-view';

  static const tambahDokumenView = '/tambah-dokumen-view';

  static const updateDokumenView = '/update-dokumen-view';

  static const tambahDokumenPerusahaanPtView =
      '/tambah-dokumen-perusahaan-pt-view';

  static const updateDokumenPerusahaanPtView =
      '/update-dokumen-perusahaan-pt-view';

  static const tambahDokumenPerusahaanCvView =
      '/tambah-dokumen-perusahaan-cv-view';

  static const updateDokumenPerusahaanCvView =
      '/update-dokumen-perusahaan-cv-view';

  static const hasilPrescreeningViewRitel = '/hasil-prescreening-view-ritel';

  static const informasiFinansialView = '/informasi-finansial-view';

  static const informasiFinansialViewPeriodOne =
      '/informasi-finansial-view-period-one';

  static const informasiFinansialFormPeriodOne =
      '/informasi-finansial-form-period-one';

  static const mutasiRekeningView = '/mutasi-rekening-view';

  static const mutasiRekeningFormView = '/mutasi-rekening-form-view';

  static const mutasiRekeningDetails = '/mutasi-rekening-details';

  static const informasiNonFinasialPageOneA =
      '/informasi-non-finasial-page-one-a';

  static const summaryInformasiNonFinansial =
      '/summary-informasi-non-finansial';

  static const informasiAgunanViewRitel = '/informasi-agunan-view-ritel';

  static const informasiAgunanTambahanView = '/informasi-agunan-tambahan-view';

  static const informasiAgunanTambahanDetailsTanah =
      '/informasi-agunan-tambahan-details-tanah';

  static const informasiAgunanTambahanDetailsTanahBangunan =
      '/informasi-agunan-tambahan-details-tanah-bangunan';

  static const informasiAgunanTambahanDetailsMotor =
      '/informasi-agunan-tambahan-details-motor';

  static const informasiAgunanTambahanDetailsCashCollateral =
      '/informasi-agunan-tambahan-details-cash-collateral';

  static const informasiAgunanTambahanDetailsMesin =
      '/informasi-agunan-tambahan-details-mesin';

  static const informasiAgunanLKNView = '/informasi-agunan-lk-nView';

  static const informasiAgunanLknDetails = '/informasi-agunan-lkn-details';

  static const informasiAgunanLknForm = '/informasi-agunan-lkn-form';

  static const informasiPinjamanViewRitel = '/informasi-pinjaman-view-ritel';

  static const informasiPinjamanDetailsRitel =
      '/informasi-pinjaman-details-ritel';

  static const riwayatProjekView = '/riwayat-projek-view';

  static const tradeCheckingView = '/trade-checking-view';

  static const tradeCheckingDetails = '/trade-checking-details';

  static const riwayatProjekDetails = '/riwayat-projek-details';

  static const uploadCRRView = '/upload-cr-rView';

  static const uploadCRRDetails = '/upload-cr-rDetails';

  static const hasilAnalisaPinjamanViewRitel =
      '/hasil-analisa-pinjaman-view-ritel';

  static const hasilAnalisaPinjamanSuccessView =
      '/hasil-analisa-pinjaman-success-view';

  static const tDPPeroranganViewPari = '/t-dp-perorangan-view-pari';

  static const informasiDataDiriViewPari = '/informasi-data-diri-view-pari';

  static const informasiUsahaDebiturPariView =
      '/informasi-usaha-debitur-pari-view';

  static const informasiLainnyaPariView = '/informasi-lainnya-pari-view';

  static const pipelineDetailsViewPari = '/pipeline-details-view-pari';

  static const pipelineSuccessViewPari = '/pipeline-success-view-pari';

  static const informasiAgunanViewPari = '/informasi-agunan-view-pari';

  static const informasiAgunanTambahanViewPari =
      '/informasi-agunan-tambahan-view-pari';

  static const informasiAgunanTambahanDetailsTanahPari =
      '/informasi-agunan-tambahan-details-tanah-pari';

  static const informasiAgunanTambahanDetailsTanahBangunanPari =
      '/informasi-agunan-tambahan-details-tanah-bangunan-pari';

  static const informasiAgunanTambahanDetailsMotorPari =
      '/informasi-agunan-tambahan-details-motor-pari';

  static const informasiAgunanTambahanDetailsCashCollateralPari =
      '/informasi-agunan-tambahan-details-cash-collateral-pari';

  static const informasiAgunanTambahanDetailsMesinPari =
      '/informasi-agunan-tambahan-details-mesin-pari';

  static const informasiAgunanLknDetailsPari =
      '/informasi-agunan-lkn-details-pari';

  static const informasiNonFinasialPageOneAPari =
      '/informasi-non-finasial-page-one-aPari';

  static const summaryInformasiNonFinansialPari =
      '/summary-informasi-non-finansial-pari';

  static const informasiPinjamanViewPari = '/informasi-pinjaman-view-pari';

  static const informasiPinjamanDetailsPari =
      '/informasi-pinjaman-details-pari';

  static const informasiDebiturPari = '/informasi-debitur-pari';

  static const informasiFinansialViewPari = '/informasi-finansial-view-pari';

  static const legalitasUsahaPariView = '/legalitas-usaha-pari-view';

  static const tambahDokumenPariView = '/tambah-dokumen-pari-view';

  static const updateDokumenPariView = '/update-dokumen-pari-view';

  static const informasiFinansialFormPeriodPari =
      '/informasi-finansial-form-period-pari';

  static const mutasiTransaksiPariView = '/mutasi-transaksi-pari-view';

  static const mutasiTransaksiDetail = '/mutasi-transaksi-detail';

  static const mutasiRekeningPariView = '/mutasi-rekening-pari-view';

  static const mutasiRekeningPariFormView = '/mutasi-rekening-pari-form-view';

  static const mutasiRekeningDetailsPari = '/mutasi-rekening-details-pari';

  static const mutasiRekeningDetailsItemPari =
      '/mutasi-rekening-details-item-pari';

  static const monitoringRitelView = '/monitoring-ritel-view';

  static const monitoringDetailView = '/monitoring-detail-view';

  static const tambahPencairanView = '/tambah-pencairan-view';

  static const pinjamanDetailView = '/pinjaman-detail-view';

  static const penurunanPinjamanView = '/penurunan-pinjaman-view';

  static const penurunanPinjamanSuccessView =
      '/penurunan-pinjaman-success-view';

  static const all = <String>{
    startupView,
    loginView,
    mainView,
    berandaView,
    pipelineView,
    prakarsaView,
    addressSelectionView,
    akunView,
    serverMaintenance,
    noNetwork,
    guidedCameraView,
    informasiPribadiView,
    bantuanView,
    syaratKetentuanView,
    kebijakanPrivasiView,
    statusKelolaanItemDetailsView,
    partnershipViewRitel,
    tambahPartnershipViewRitel,
    tDPViewRitel,
    tDPPeroranganViewRitel,
    informasiDataDiriView,
    informasiUsahaDebiturView,
    informasiLainnyaView,
    pipelineDetailsViewRitel,
    tDPPerusahaanPtViewRitel,
    informasiPerusahaanPtView,
    informasiPengurusPtView,
    informasiLainnyaPtView,
    pipelineDetailsPtViewRitel,
    informasiPengurusPemilikBoardView,
    hasilPrescreeningViewPerusahaanCVRitel,
    tDPPerusahaanCvViewRitel,
    informasiPerusahaanCvView,
    informasiPengurusCvView,
    informasiLainnyaCvView,
    pipelineDetailsCvViewRitel,
    pipelineSuccessViewRitel,
    informasiPengurusPemilikBoardCvView,
    prakarsaDetailsViewRitel,
    informasiDebiturView,
    informasiPerusahaanView,
    informasiPengurusView,
    legalitasUsahaView,
    legalitasUsahaPerusahaanPtView,
    legalitasUsahaPerusahaanCvView,
    tambahDokumenView,
    updateDokumenView,
    tambahDokumenPerusahaanPtView,
    updateDokumenPerusahaanPtView,
    tambahDokumenPerusahaanCvView,
    updateDokumenPerusahaanCvView,
    hasilPrescreeningViewRitel,
    informasiFinansialView,
    informasiFinansialViewPeriodOne,
    informasiFinansialFormPeriodOne,
    mutasiRekeningView,
    mutasiRekeningFormView,
    mutasiRekeningDetails,
    informasiNonFinasialPageOneA,
    summaryInformasiNonFinansial,
    informasiAgunanViewRitel,
    informasiAgunanTambahanView,
    informasiAgunanTambahanDetailsTanah,
    informasiAgunanTambahanDetailsTanahBangunan,
    informasiAgunanTambahanDetailsMotor,
    informasiAgunanTambahanDetailsCashCollateral,
    informasiAgunanTambahanDetailsMesin,
    informasiAgunanLKNView,
    informasiAgunanLknDetails,
    informasiAgunanLknForm,
    informasiPinjamanViewRitel,
    informasiPinjamanDetailsRitel,
    riwayatProjekView,
    tradeCheckingView,
    tradeCheckingDetails,
    riwayatProjekDetails,
    uploadCRRView,
    uploadCRRDetails,
    hasilAnalisaPinjamanViewRitel,
    hasilAnalisaPinjamanSuccessView,
    tDPPeroranganViewPari,
    informasiDataDiriViewPari,
    informasiUsahaDebiturPariView,
    informasiLainnyaPariView,
    pipelineDetailsViewPari,
    pipelineSuccessViewPari,
    informasiAgunanViewPari,
    informasiAgunanTambahanViewPari,
    informasiAgunanTambahanDetailsTanahPari,
    informasiAgunanTambahanDetailsTanahBangunanPari,
    informasiAgunanTambahanDetailsMotorPari,
    informasiAgunanTambahanDetailsCashCollateralPari,
    informasiAgunanTambahanDetailsMesinPari,
    informasiAgunanLknDetailsPari,
    informasiNonFinasialPageOneAPari,
    summaryInformasiNonFinansialPari,
    informasiPinjamanViewPari,
    informasiPinjamanDetailsPari,
    informasiDebiturPari,
    informasiFinansialViewPari,
    legalitasUsahaPariView,
    tambahDokumenPariView,
    updateDokumenPariView,
    informasiFinansialFormPeriodPari,
    mutasiTransaksiPariView,
    mutasiTransaksiDetail,
    mutasiRekeningPariView,
    mutasiRekeningPariFormView,
    mutasiRekeningDetailsPari,
    mutasiRekeningDetailsItemPari,
    monitoringRitelView,
    monitoringDetailView,
    tambahPencairanView,
    pinjamanDetailView,
    penurunanPinjamanView,
    penurunanPinjamanSuccessView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i4.MainView,
    ),
    _i1.RouteDef(
      Routes.berandaView,
      page: _i5.BerandaView,
    ),
    _i1.RouteDef(
      Routes.pipelineView,
      page: _i6.PipelineView,
    ),
    _i1.RouteDef(
      Routes.prakarsaView,
      page: _i7.PrakarsaView,
    ),
    _i1.RouteDef(
      Routes.addressSelectionView,
      page: _i8.AddressSelectionView,
    ),
    _i1.RouteDef(
      Routes.akunView,
      page: _i9.AkunView,
    ),
    _i1.RouteDef(
      Routes.serverMaintenance,
      page: _i10.ServerMaintenance,
    ),
    _i1.RouteDef(
      Routes.noNetwork,
      page: _i11.NoNetwork,
    ),
    _i1.RouteDef(
      Routes.guidedCameraView,
      page: _i12.GuidedCameraView,
    ),
    _i1.RouteDef(
      Routes.informasiPribadiView,
      page: _i13.InformasiPribadiView,
    ),
    _i1.RouteDef(
      Routes.bantuanView,
      page: _i14.BantuanView,
    ),
    _i1.RouteDef(
      Routes.syaratKetentuanView,
      page: _i15.SyaratKetentuanView,
    ),
    _i1.RouteDef(
      Routes.kebijakanPrivasiView,
      page: _i16.KebijakanPrivasiView,
    ),
    _i1.RouteDef(
      Routes.statusKelolaanItemDetailsView,
      page: _i17.StatusKelolaanItemDetailsView,
    ),
    _i1.RouteDef(
      Routes.partnershipViewRitel,
      page: _i18.PartnershipViewRitel,
    ),
    _i1.RouteDef(
      Routes.tambahPartnershipViewRitel,
      page: _i19.TambahPartnershipViewRitel,
    ),
    _i1.RouteDef(
      Routes.tDPViewRitel,
      page: _i20.TDPViewRitel,
    ),
    _i1.RouteDef(
      Routes.tDPPeroranganViewRitel,
      page: _i21.TDPPeroranganViewRitel,
    ),
    _i1.RouteDef(
      Routes.informasiDataDiriView,
      page: _i22.InformasiDataDiriView,
    ),
    _i1.RouteDef(
      Routes.informasiUsahaDebiturView,
      page: _i23.InformasiUsahaDebiturView,
    ),
    _i1.RouteDef(
      Routes.informasiLainnyaView,
      page: _i24.InformasiLainnyaView,
    ),
    _i1.RouteDef(
      Routes.pipelineDetailsViewRitel,
      page: _i25.PipelineDetailsViewRitel,
    ),
    _i1.RouteDef(
      Routes.tDPPerusahaanPtViewRitel,
      page: _i26.TDPPerusahaanPtViewRitel,
    ),
    _i1.RouteDef(
      Routes.informasiPerusahaanPtView,
      page: _i27.InformasiPerusahaanPtView,
    ),
    _i1.RouteDef(
      Routes.informasiPengurusPtView,
      page: _i28.InformasiPengurusPtView,
    ),
    _i1.RouteDef(
      Routes.informasiLainnyaPtView,
      page: _i29.InformasiLainnyaPtView,
    ),
    _i1.RouteDef(
      Routes.pipelineDetailsPtViewRitel,
      page: _i30.PipelineDetailsPtViewRitel,
    ),
    _i1.RouteDef(
      Routes.informasiPengurusPemilikBoardView,
      page: _i31.InformasiPengurusPemilikBoardView,
    ),
    _i1.RouteDef(
      Routes.hasilPrescreeningViewPerusahaanCVRitel,
      page: _i32.HasilPrescreeningViewPerusahaanCVRitel,
    ),
    _i1.RouteDef(
      Routes.tDPPerusahaanCvViewRitel,
      page: _i33.TDPPerusahaanCvViewRitel,
    ),
    _i1.RouteDef(
      Routes.informasiPerusahaanCvView,
      page: _i34.InformasiPerusahaanCvView,
    ),
    _i1.RouteDef(
      Routes.informasiPengurusCvView,
      page: _i35.InformasiPengurusCvView,
    ),
    _i1.RouteDef(
      Routes.informasiLainnyaCvView,
      page: _i36.InformasiLainnyaCvView,
    ),
    _i1.RouteDef(
      Routes.pipelineDetailsCvViewRitel,
      page: _i37.PipelineDetailsCvViewRitel,
    ),
    _i1.RouteDef(
      Routes.pipelineSuccessViewRitel,
      page: _i38.PipelineSuccessViewRitel,
    ),
    _i1.RouteDef(
      Routes.informasiPengurusPemilikBoardCvView,
      page: _i39.InformasiPengurusPemilikBoardCvView,
    ),
    _i1.RouteDef(
      Routes.prakarsaDetailsViewRitel,
      page: _i40.PrakarsaDetailsViewRitel,
    ),
    _i1.RouteDef(
      Routes.informasiDebiturView,
      page: _i41.InformasiDebiturView,
    ),
    _i1.RouteDef(
      Routes.informasiPerusahaanView,
      page: _i42.InformasiPerusahaanView,
    ),
    _i1.RouteDef(
      Routes.informasiPengurusView,
      page: _i43.InformasiPengurusView,
    ),
    _i1.RouteDef(
      Routes.legalitasUsahaView,
      page: _i44.LegalitasUsahaView,
    ),
    _i1.RouteDef(
      Routes.legalitasUsahaPerusahaanPtView,
      page: _i45.LegalitasUsahaPerusahaanPtView,
    ),
    _i1.RouteDef(
      Routes.legalitasUsahaPerusahaanCvView,
      page: _i46.LegalitasUsahaPerusahaanCvView,
    ),
    _i1.RouteDef(
      Routes.tambahDokumenView,
      page: _i47.TambahDokumenView,
    ),
    _i1.RouteDef(
      Routes.updateDokumenView,
      page: _i48.UpdateDokumenView,
    ),
    _i1.RouteDef(
      Routes.tambahDokumenPerusahaanPtView,
      page: _i49.TambahDokumenPerusahaanPtView,
    ),
    _i1.RouteDef(
      Routes.updateDokumenPerusahaanPtView,
      page: _i50.UpdateDokumenPerusahaanPtView,
    ),
    _i1.RouteDef(
      Routes.tambahDokumenPerusahaanCvView,
      page: _i51.TambahDokumenPerusahaanCvView,
    ),
    _i1.RouteDef(
      Routes.updateDokumenPerusahaanCvView,
      page: _i52.UpdateDokumenPerusahaanCvView,
    ),
    _i1.RouteDef(
      Routes.hasilPrescreeningViewRitel,
      page: _i53.HasilPrescreeningViewRitel,
    ),
    _i1.RouteDef(
      Routes.informasiFinansialView,
      page: _i54.InformasiFinansialView,
    ),
    _i1.RouteDef(
      Routes.informasiFinansialViewPeriodOne,
      page: _i55.InformasiFinansialViewPeriodOne,
    ),
    _i1.RouteDef(
      Routes.informasiFinansialFormPeriodOne,
      page: _i56.InformasiFinansialFormPeriodOne,
    ),
    _i1.RouteDef(
      Routes.mutasiRekeningView,
      page: _i57.MutasiRekeningView,
    ),
    _i1.RouteDef(
      Routes.mutasiRekeningFormView,
      page: _i58.MutasiRekeningFormView,
    ),
    _i1.RouteDef(
      Routes.mutasiRekeningDetails,
      page: _i59.MutasiRekeningDetails,
    ),
    _i1.RouteDef(
      Routes.informasiNonFinasialPageOneA,
      page: _i60.InformasiNonFinasialPageOneA,
    ),
    _i1.RouteDef(
      Routes.summaryInformasiNonFinansial,
      page: _i61.SummaryInformasiNonFinansial,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanViewRitel,
      page: _i62.InformasiAgunanViewRitel,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanView,
      page: _i63.InformasiAgunanTambahanView,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsTanah,
      page: _i64.InformasiAgunanTambahanDetailsTanah,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsTanahBangunan,
      page: _i65.InformasiAgunanTambahanDetailsTanahBangunan,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsMotor,
      page: _i66.InformasiAgunanTambahanDetailsMotor,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsCashCollateral,
      page: _i67.InformasiAgunanTambahanDetailsCashCollateral,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsMesin,
      page: _i68.InformasiAgunanTambahanDetailsMesin,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanLKNView,
      page: _i69.InformasiAgunanLKNView,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanLknDetails,
      page: _i70.InformasiAgunanLknDetails,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanLknForm,
      page: _i71.InformasiAgunanLknForm,
    ),
    _i1.RouteDef(
      Routes.informasiPinjamanViewRitel,
      page: _i72.InformasiPinjamanViewRitel,
    ),
    _i1.RouteDef(
      Routes.informasiPinjamanDetailsRitel,
      page: _i73.InformasiPinjamanDetailsRitel,
    ),
    _i1.RouteDef(
      Routes.riwayatProjekView,
      page: _i74.RiwayatProjekView,
    ),
    _i1.RouteDef(
      Routes.tradeCheckingView,
      page: _i75.TradeCheckingView,
    ),
    _i1.RouteDef(
      Routes.tradeCheckingDetails,
      page: _i76.TradeCheckingDetails,
    ),
    _i1.RouteDef(
      Routes.riwayatProjekDetails,
      page: _i77.RiwayatProjekDetails,
    ),
    _i1.RouteDef(
      Routes.uploadCRRView,
      page: _i78.UploadCRRView,
    ),
    _i1.RouteDef(
      Routes.uploadCRRDetails,
      page: _i79.UploadCRRDetails,
    ),
    _i1.RouteDef(
      Routes.hasilAnalisaPinjamanViewRitel,
      page: _i80.HasilAnalisaPinjamanViewRitel,
    ),
    _i1.RouteDef(
      Routes.hasilAnalisaPinjamanSuccessView,
      page: _i81.HasilAnalisaPinjamanSuccessView,
    ),
    _i1.RouteDef(
      Routes.tDPPeroranganViewPari,
      page: _i82.TDPPeroranganViewPari,
    ),
    _i1.RouteDef(
      Routes.informasiDataDiriViewPari,
      page: _i83.InformasiDataDiriViewPari,
    ),
    _i1.RouteDef(
      Routes.informasiUsahaDebiturPariView,
      page: _i84.InformasiUsahaDebiturPariView,
    ),
    _i1.RouteDef(
      Routes.informasiLainnyaPariView,
      page: _i85.InformasiLainnyaPariView,
    ),
    _i1.RouteDef(
      Routes.pipelineDetailsViewPari,
      page: _i86.PipelineDetailsViewPari,
    ),
    _i1.RouteDef(
      Routes.pipelineSuccessViewPari,
      page: _i87.PipelineSuccessViewPari,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanViewPari,
      page: _i88.InformasiAgunanViewPari,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanViewPari,
      page: _i89.InformasiAgunanTambahanViewPari,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsTanahPari,
      page: _i90.InformasiAgunanTambahanDetailsTanahPari,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsTanahBangunanPari,
      page: _i91.InformasiAgunanTambahanDetailsTanahBangunanPari,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsMotorPari,
      page: _i92.InformasiAgunanTambahanDetailsMotorPari,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsCashCollateralPari,
      page: _i93.InformasiAgunanTambahanDetailsCashCollateralPari,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanTambahanDetailsMesinPari,
      page: _i94.InformasiAgunanTambahanDetailsMesinPari,
    ),
    _i1.RouteDef(
      Routes.informasiAgunanLknDetailsPari,
      page: _i95.InformasiAgunanLknDetailsPari,
    ),
    _i1.RouteDef(
      Routes.informasiNonFinasialPageOneAPari,
      page: _i96.InformasiNonFinasialPageOneAPari,
    ),
    _i1.RouteDef(
      Routes.summaryInformasiNonFinansialPari,
      page: _i97.SummaryInformasiNonFinansialPari,
    ),
    _i1.RouteDef(
      Routes.informasiPinjamanViewPari,
      page: _i98.InformasiPinjamanViewPari,
    ),
    _i1.RouteDef(
      Routes.informasiPinjamanDetailsPari,
      page: _i99.InformasiPinjamanDetailsPari,
    ),
    _i1.RouteDef(
      Routes.informasiDebiturPari,
      page: _i100.InformasiDebiturPari,
    ),
    _i1.RouteDef(
      Routes.informasiFinansialViewPari,
      page: _i101.InformasiFinansialViewPari,
    ),
    _i1.RouteDef(
      Routes.legalitasUsahaPariView,
      page: _i102.LegalitasUsahaPariView,
    ),
    _i1.RouteDef(
      Routes.tambahDokumenPariView,
      page: _i103.TambahDokumenPariView,
    ),
    _i1.RouteDef(
      Routes.updateDokumenPariView,
      page: _i104.UpdateDokumenPariView,
    ),
    _i1.RouteDef(
      Routes.informasiFinansialFormPeriodPari,
      page: _i105.InformasiFinansialFormPeriodPari,
    ),
    _i1.RouteDef(
      Routes.mutasiTransaksiPariView,
      page: _i106.MutasiTransaksiPariView,
    ),
    _i1.RouteDef(
      Routes.mutasiTransaksiDetail,
      page: _i107.MutasiTransaksiDetail,
    ),
    _i1.RouteDef(
      Routes.mutasiRekeningPariView,
      page: _i108.MutasiRekeningPariView,
    ),
    _i1.RouteDef(
      Routes.mutasiRekeningPariFormView,
      page: _i109.MutasiRekeningPariFormView,
    ),
    _i1.RouteDef(
      Routes.mutasiRekeningDetailsPari,
      page: _i110.MutasiRekeningDetailsPari,
    ),
    _i1.RouteDef(
      Routes.mutasiRekeningDetailsItemPari,
      page: _i111.MutasiRekeningDetailsItemPari,
    ),
    _i1.RouteDef(
      Routes.monitoringRitelView,
      page: _i112.MonitoringRitelView,
    ),
    _i1.RouteDef(
      Routes.monitoringDetailView,
      page: _i113.MonitoringDetailView,
    ),
    _i1.RouteDef(
      Routes.tambahPencairanView,
      page: _i114.TambahPencairanView,
    ),
    _i1.RouteDef(
      Routes.pinjamanDetailView,
      page: _i115.PinjamanDetailView,
    ),
    _i1.RouteDef(
      Routes.penurunanPinjamanView,
      page: _i116.PenurunanPinjamanView,
    ),
    _i1.RouteDef(
      Routes.penurunanPinjamanSuccessView,
      page: _i117.PenurunanPinjamanSuccessView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.MainView: (data) {
      final args = data.getArgs<MainViewArguments>(
        orElse: () => const MainViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i4.MainView(
            key: args.key,
            index: args.index,
            prakarsaTabsIndex: args.prakarsaTabsIndex),
        settings: data,
      );
    },
    _i5.BerandaView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.BerandaView(),
        settings: data,
      );
    },
    _i6.PipelineView: (data) {
      final args = data.getArgs<PipelineViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i6.PipelineView(
            key: args.key,
            index: args.index,
            bottomPadding: args.bottomPadding),
        settings: data,
      );
    },
    _i7.PrakarsaView: (data) {
      final args = data.getArgs<PrakarsaViewArguments>(
        orElse: () => const PrakarsaViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i7.PrakarsaView(
            key: args.key,
            index: args.index,
            prakarsaTabsIndex: args.prakarsaTabsIndex),
        settings: data,
      );
    },
    _i8.AddressSelectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.AddressSelectionView(),
        settings: data,
      );
    },
    _i9.AkunView: (data) {
      final args = data.getArgs<AkunViewArguments>(
        orElse: () => const AkunViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i9.AkunView(
            fromBerandaHeader: args.fromBerandaHeader, key: args.key),
        settings: data,
      );
    },
    _i10.ServerMaintenance: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ServerMaintenance(),
        settings: data,
      );
    },
    _i11.NoNetwork: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.NoNetwork(),
        settings: data,
      );
    },
    _i12.GuidedCameraView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.GuidedCameraView(),
        settings: data,
      );
    },
    _i13.InformasiPribadiView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.InformasiPribadiView(),
        settings: data,
      );
    },
    _i14.BantuanView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.BantuanView(),
        settings: data,
      );
    },
    _i15.SyaratKetentuanView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.SyaratKetentuanView(),
        settings: data,
      );
    },
    _i16.KebijakanPrivasiView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.KebijakanPrivasiView(),
        settings: data,
      );
    },
    _i17.StatusKelolaanItemDetailsView: (data) {
      final args =
          data.getArgs<StatusKelolaanItemDetailsViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i17.StatusKelolaanItemDetailsView(
            key: args.key,
            statusKelolaanType: args.statusKelolaanType,
            value: args.value),
        settings: data,
      );
    },
    _i18.PartnershipViewRitel: (data) {
      final args = data.getArgs<PartnershipViewRitelArguments>(
        orElse: () => const PartnershipViewRitelArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i18.PartnershipViewRitel(
            key: args.key,
            idKelolaan: args.idKelolaan,
            idPartner: args.idPartner,
            pinjamanDetail: args.pinjamanDetail,
            counter: args.counter,
            status: args.status,
            loanType: args.loanType),
        settings: data,
      );
    },
    _i19.TambahPartnershipViewRitel: (data) {
      final args = data.getArgs<TambahPartnershipViewRitelArguments>(
        orElse: () => const TambahPartnershipViewRitelArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i19.TambahPartnershipViewRitel(
            key: args.key,
            idKelolaan: args.idKelolaan,
            pinjamanDetail: args.pinjamanDetail,
            counter: args.counter,
            status: args.status,
            loanType: args.loanType),
        settings: data,
      );
    },
    _i20.TDPViewRitel: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.TDPViewRitel(),
        settings: data,
      );
    },
    _i21.TDPPeroranganViewRitel: (data) {
      final args = data.getArgs<TDPPeroranganViewRitelArguments>(
        orElse: () => const TDPPeroranganViewRitelArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i21.TDPPeroranganViewRitel(
            key: args.key,
            pipelineId: args.pipelineId,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            fromTDPViewRitel: args.fromTDPViewRitel,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i22.InformasiDataDiriView: (data) {
      final args = data.getArgs<InformasiDataDiriViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i22.InformasiDataDiriView(
            key: args.key,
            pipelineId: args.pipelineId,
            fromTdpPeroranganView: args.fromTdpPeroranganView,
            ritelInformasiDataDiri: args.ritelInformasiDataDiri,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i23.InformasiUsahaDebiturView: (data) {
      final args =
          data.getArgs<InformasiUsahaDebiturViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i23.InformasiUsahaDebiturView(
            key: args.key,
            pipelineId: args.pipelineId,
            ritelInformasiUsaha: args.ritelInformasiUsaha,
            fromTdpPeroranganView: args.fromTdpPeroranganView,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i24.InformasiLainnyaView: (data) {
      final args = data.getArgs<InformasiLainnyaViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i24.InformasiLainnyaView(
            key: args.key,
            pipelineId: args.pipelineId,
            ritelInformasiLainnya: args.ritelInformasiLainnya,
            fromTdpPeroranganView: args.fromTdpPeroranganView,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i25.PipelineDetailsViewRitel: (data) {
      final args =
          data.getArgs<PipelineDetailsViewRitelArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i25.PipelineDetailsViewRitel(
            args.id, args.debiturType, args.statusPipeline,
            key: args.key),
        settings: data,
      );
    },
    _i26.TDPPerusahaanPtViewRitel: (data) {
      final args = data.getArgs<TDPPerusahaanPtViewRitelArguments>(
        orElse: () => const TDPPerusahaanPtViewRitelArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i26.TDPPerusahaanPtViewRitel(
            key: args.key,
            pipelineId: args.pipelineId,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            fromTDPViewRitel: args.fromTDPViewRitel,
            statusPipeline: args.statusPipeline,
            stepperPengurus: args.stepperPengurus),
        settings: data,
      );
    },
    _i27.InformasiPerusahaanPtView: (data) {
      final args =
          data.getArgs<InformasiPerusahaanPtViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i27.InformasiPerusahaanPtView(
            key: args.key,
            pipelineId: args.pipelineId,
            fromTdpPerusahaanPtView: args.fromTdpPerusahaanPtView,
            ritelInformasiPerusahaanPt: args.ritelInformasiPerusahaanPt,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i28.InformasiPengurusPtView: (data) {
      final args =
          data.getArgs<InformasiPengurusPtViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i28.InformasiPengurusPtView(
            key: args.key,
            pipelineId: args.pipelineId,
            fromTdpPerusahaanPtView: args.fromTdpPerusahaanPtView,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline,
            ritelListPengurusPerusahaan: args.ritelListPengurusPerusahaan,
            nomorPengurus: args.nomorPengurus),
        settings: data,
      );
    },
    _i29.InformasiLainnyaPtView: (data) {
      final args = data.getArgs<InformasiLainnyaPtViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i29.InformasiLainnyaPtView(
            key: args.key,
            pipelineId: args.pipelineId,
            ritelInformasiLainnyaPt: args.ritelInformasiLainnyaPt,
            fromTdpPerusahaanPtView: args.fromTdpPerusahaanPtView,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i30.PipelineDetailsPtViewRitel: (data) {
      final args =
          data.getArgs<PipelineDetailsPtViewRitelArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i30.PipelineDetailsPtViewRitel(
            args.id, args.debiturType, args.statusPipeline,
            key: args.key),
        settings: data,
      );
    },
    _i31.InformasiPengurusPemilikBoardView: (data) {
      final args = data.getArgs<InformasiPengurusPemilikBoardViewArguments>(
        orElse: () => const InformasiPengurusPemilikBoardViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i31.InformasiPengurusPemilikBoardView(
            key: args.key, pipelineId: args.pipelineId),
        settings: data,
      );
    },
    _i32.HasilPrescreeningViewPerusahaanCVRitel: (data) {
      final args =
          data.getArgs<HasilPrescreeningViewPerusahaanCVRitelArguments>(
              nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i32.HasilPrescreeningViewPerusahaanCVRitel(
            key: args.key,
            pipelineFlagId: args.pipelineFlagId,
            codeTable: args.codeTable,
            fromPrakarsaDetails: args.fromPrakarsaDetails),
        settings: data,
      );
    },
    _i33.TDPPerusahaanCvViewRitel: (data) {
      final args = data.getArgs<TDPPerusahaanCvViewRitelArguments>(
        orElse: () => const TDPPerusahaanCvViewRitelArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i33.TDPPerusahaanCvViewRitel(
            key: args.key,
            pipelineId: args.pipelineId,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            fromTDPViewRitel: args.fromTDPViewRitel,
            statusPipeline: args.statusPipeline,
            stepperPengurus: args.stepperPengurus),
        settings: data,
      );
    },
    _i34.InformasiPerusahaanCvView: (data) {
      final args =
          data.getArgs<InformasiPerusahaanCvViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i34.InformasiPerusahaanCvView(
            key: args.key,
            pipelineId: args.pipelineId,
            fromTdpPeroranganView: args.fromTdpPeroranganView,
            ritelInformasiPerusahaanCv: args.ritelInformasiPerusahaanCv,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i35.InformasiPengurusCvView: (data) {
      final args = data.getArgs<InformasiPengurusCvViewArguments>(
        orElse: () => const InformasiPengurusCvViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i35.InformasiPengurusCvView(
            key: args.key,
            pipelineId: args.pipelineId,
            ritelInformasiPengurusCv: args.ritelInformasiPengurusCv,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline,
            nomorPengurus: args.nomorPengurus),
        settings: data,
      );
    },
    _i36.InformasiLainnyaCvView: (data) {
      final args = data.getArgs<InformasiLainnyaCvViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i36.InformasiLainnyaCvView(
            key: args.key,
            pipelineId: args.pipelineId,
            ritelInformasiLainnya: args.ritelInformasiLainnya,
            fromTdpPerusahaanView: args.fromTdpPerusahaanView,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i37.PipelineDetailsCvViewRitel: (data) {
      final args =
          data.getArgs<PipelineDetailsCvViewRitelArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i37.PipelineDetailsCvViewRitel(
            args.id, args.debiturType, args.statusPipeline, args.codeTable,
            key: args.key),
        settings: data,
      );
    },
    _i38.PipelineSuccessViewRitel: (data) {
      final args = data.getArgs<PipelineSuccessViewRitelArguments>(
        orElse: () => const PipelineSuccessViewRitelArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i38.PipelineSuccessViewRitel(
            key: args.key,
            pipelineId: args.pipelineId,
            debiturName: args.debiturName,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i39.InformasiPengurusPemilikBoardCvView: (data) {
      final args = data.getArgs<InformasiPengurusPemilikBoardCvViewArguments>(
        orElse: () => const InformasiPengurusPemilikBoardCvViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i39.InformasiPengurusPemilikBoardCvView(
            key: args.key, pipelineId: args.pipelineId),
        settings: data,
      );
    },
    _i40.PrakarsaDetailsViewRitel: (data) {
      final args =
          data.getArgs<PrakarsaDetailsViewRitelArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i40.PrakarsaDetailsViewRitel(
            key: args.key,
            index: args.index,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i41.InformasiDebiturView: (data) {
      final args = data.getArgs<InformasiDebiturViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i41.InformasiDebiturView(
            key: args.key,
            pipelinesId: args.pipelinesId,
            prakarsaId: args.prakarsaId,
            backPipeline: args.backPipeline,
            status: args.status),
        settings: data,
      );
    },
    _i42.InformasiPerusahaanView: (data) {
      final args =
          data.getArgs<InformasiPerusahaanViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i42.InformasiPerusahaanView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i43.InformasiPengurusView: (data) {
      final args = data.getArgs<InformasiPengurusViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i43.InformasiPengurusView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i44.LegalitasUsahaView: (data) {
      final args = data.getArgs<LegalitasUsahaViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i44.LegalitasUsahaView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            ritelPrakarsaPerorangan: args.ritelPrakarsaPerorangan,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i45.LegalitasUsahaPerusahaanPtView: (data) {
      final args =
          data.getArgs<LegalitasUsahaPerusahaanPtViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i45.LegalitasUsahaPerusahaanPtView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i46.LegalitasUsahaPerusahaanCvView: (data) {
      final args =
          data.getArgs<LegalitasUsahaPerusahaanCvViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i46.LegalitasUsahaPerusahaanCvView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i47.TambahDokumenView: (data) {
      final args = data.getArgs<TambahDokumenViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i47.TambahDokumenView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            ritelPrakarsaPerorangan: args.ritelPrakarsaPerorangan,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i48.UpdateDokumenView: (data) {
      final args = data.getArgs<UpdateDokumenViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i48.UpdateDokumenView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            uploadDocFrom: args.uploadDocFrom,
            ritelLegalitasUsahaUtama: args.ritelLegalitasUsahaUtama,
            ritelLegalitasUsahaLainnya: args.ritelLegalitasUsahaLainnya,
            ritelPrakarsaPerorangan: args.ritelPrakarsaPerorangan,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i49.TambahDokumenPerusahaanPtView: (data) {
      final args =
          data.getArgs<TambahDokumenPerusahaanPtViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i49.TambahDokumenPerusahaanPtView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i50.UpdateDokumenPerusahaanPtView: (data) {
      final args =
          data.getArgs<UpdateDokumenPerusahaanPtViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i50.UpdateDokumenPerusahaanPtView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            uploadDocFrom: args.uploadDocFrom,
            ritelLegalitasUsahaUtama: args.ritelLegalitasUsahaUtama,
            ritelLegalitasUsahaLainnya: args.ritelLegalitasUsahaLainnya,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i51.TambahDokumenPerusahaanCvView: (data) {
      final args =
          data.getArgs<TambahDokumenPerusahaanCvViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i51.TambahDokumenPerusahaanCvView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i52.UpdateDokumenPerusahaanCvView: (data) {
      final args =
          data.getArgs<UpdateDokumenPerusahaanCvViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i52.UpdateDokumenPerusahaanCvView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            uploadDocFrom: args.uploadDocFrom,
            ritelLegalitasUsahaUtama: args.ritelLegalitasUsahaUtama,
            ritelLegalitasUsahaLainnya: args.ritelLegalitasUsahaLainnya,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i53.HasilPrescreeningViewRitel: (data) {
      final args = data.getArgs<HasilPrescreeningViewRitelArguments>(
        orElse: () => const HasilPrescreeningViewRitelArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i53.HasilPrescreeningViewRitel(
            key: args.key,
            pipelineflagId: args.pipelineflagId,
            name: args.name,
            ktpNum: args.ktpNum,
            fromPrakarsaDetails: args.fromPrakarsaDetails),
        settings: data,
      );
    },
    _i54.InformasiFinansialView: (data) {
      final args = data.getArgs<InformasiFinansialViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i54.InformasiFinansialView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i55.InformasiFinansialViewPeriodOne: (data) {
      final args =
          data.getArgs<InformasiFinansialViewPeriodOneArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i55.InformasiFinansialViewPeriodOne(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i56.InformasiFinansialFormPeriodOne: (data) {
      final args =
          data.getArgs<InformasiFinansialFormPeriodOneArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i56.InformasiFinansialFormPeriodOne(
            key: args.key,
            prakarsaId: args.prakarsaId,
            isFromForm: args.isFromForm,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i57.MutasiRekeningView: (data) {
      final args = data.getArgs<MutasiRekeningViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i57.MutasiRekeningView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i58.MutasiRekeningFormView: (data) {
      final args = data.getArgs<MutasiRekeningFormViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i58.MutasiRekeningFormView(
            key: args.key,
            ritelMutasiRekening: args.ritelMutasiRekening,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable,
            index: args.index),
        settings: data,
      );
    },
    _i59.MutasiRekeningDetails: (data) {
      final args = data.getArgs<MutasiRekeningDetailsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i59.MutasiRekeningDetails(
            key: args.key,
            ritelMutasiRekening: args.ritelMutasiRekening,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable,
            index: args.index),
        settings: data,
      );
    },
    _i60.InformasiNonFinasialPageOneA: (data) {
      final args =
          data.getArgs<InformasiNonFinasialPageOneAArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i60.InformasiNonFinasialPageOneA(
            key: args.key,
            prakarsaId: args.prakarsaId,
            name: args.name,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i61.SummaryInformasiNonFinansial: (data) {
      final args =
          data.getArgs<SummaryInformasiNonFinansialArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i61.SummaryInformasiNonFinansial(
            key: args.key,
            fullName: args.fullName,
            summaryNonFinansial: args.summaryNonFinansial,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i62.InformasiAgunanViewRitel: (data) {
      final args =
          data.getArgs<InformasiAgunanViewRitelArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i62.InformasiAgunanViewRitel(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i63.InformasiAgunanTambahanView: (data) {
      final args =
          data.getArgs<InformasiAgunanTambahanViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i63.InformasiAgunanTambahanView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i64.InformasiAgunanTambahanDetailsTanah: (data) {
      final args = data.getArgs<InformasiAgunanTambahanDetailsTanahArguments>(
          nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i64.InformasiAgunanTambahanDetailsTanah(
            key: args.key,
            ritelInformasiAgunanTambahanDetailTanah:
                args.ritelInformasiAgunanTambahanDetailTanah,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i65.InformasiAgunanTambahanDetailsTanahBangunan: (data) {
      final args =
          data.getArgs<InformasiAgunanTambahanDetailsTanahBangunanArguments>(
              nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i65.InformasiAgunanTambahanDetailsTanahBangunan(
            key: args.key,
            ritelInformasiAgunanTambahanDetailTanahBangunan:
                args.ritelInformasiAgunanTambahanDetailTanahBangunan,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i66.InformasiAgunanTambahanDetailsMotor: (data) {
      final args = data.getArgs<InformasiAgunanTambahanDetailsMotorArguments>(
          nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i66.InformasiAgunanTambahanDetailsMotor(
            key: args.key,
            ritelInformasiAgunanTambahanDetailMotor:
                args.ritelInformasiAgunanTambahanDetailMotor,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i67.InformasiAgunanTambahanDetailsCashCollateral: (data) {
      final args =
          data.getArgs<InformasiAgunanTambahanDetailsCashCollateralArguments>(
              nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i67.InformasiAgunanTambahanDetailsCashCollateral(
            key: args.key,
            ritelInformasiAgunanTambahanDetailCashCollateral:
                args.ritelInformasiAgunanTambahanDetailCashCollateral,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i68.InformasiAgunanTambahanDetailsMesin: (data) {
      final args = data.getArgs<InformasiAgunanTambahanDetailsMesinArguments>(
          nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i68.InformasiAgunanTambahanDetailsMesin(
            key: args.key,
            ritelInformasiAgunanTambahanDetailMesin:
                args.ritelInformasiAgunanTambahanDetailMesin,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i69.InformasiAgunanLKNView: (data) {
      final args = data.getArgs<InformasiAgunanLKNViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i69.InformasiAgunanLKNView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i70.InformasiAgunanLknDetails: (data) {
      final args =
          data.getArgs<InformasiAgunanLknDetailsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i70.InformasiAgunanLknDetails(
            key: args.key,
            ritelLaporanKunjunganNasabah: args.ritelLaporanKunjunganNasabah,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i71.InformasiAgunanLknForm: (data) {
      final args = data.getArgs<InformasiAgunanLknFormArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i71.InformasiAgunanLknForm(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            ritelLaporanKunjunganNasabah: args.ritelLaporanKunjunganNasabah,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i72.InformasiPinjamanViewRitel: (data) {
      final args =
          data.getArgs<InformasiPinjamanViewRitelArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i72.InformasiPinjamanViewRitel(
            key: args.key,
            ritelInformasiPinjaman: args.ritelInformasiPinjaman,
            pipelinesId: args.pipelinesId,
            loanTypesId: args.loanTypesId,
            prakarsaId: args.prakarsaId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i73.InformasiPinjamanDetailsRitel: (data) {
      final args =
          data.getArgs<InformasiPinjamanDetailsRitelArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i73.InformasiPinjamanDetailsRitel(
            key: args.key,
            ritelInformasiPinjaman: args.ritelInformasiPinjaman,
            pipelinesId: args.pipelinesId,
            loanTypesId: args.loanTypesId,
            prakarsaId: args.prakarsaId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i74.RiwayatProjekView: (data) {
      final args = data.getArgs<RiwayatProjekViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i74.RiwayatProjekView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            ritelRiwayatProjek: args.ritelRiwayatProjek,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i75.TradeCheckingView: (data) {
      final args = data.getArgs<TradeCheckingViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i75.TradeCheckingView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i76.TradeCheckingDetails: (data) {
      final args = data.getArgs<TradeCheckingDetailsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i76.TradeCheckingDetails(
            key: args.key,
            ritelTradeChecking: args.ritelTradeChecking,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i77.RiwayatProjekDetails: (data) {
      final args = data.getArgs<RiwayatProjekDetailsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i77.RiwayatProjekDetails(
            key: args.key,
            ritelRiwayatProjek: args.ritelRiwayatProjek,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i78.UploadCRRView: (data) {
      final args = data.getArgs<UploadCRRViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i78.UploadCRRView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable,
            url: args.url),
        settings: data,
      );
    },
    _i79.UploadCRRDetails: (data) {
      final args = data.getArgs<UploadCRRDetailsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i79.UploadCRRDetails(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            url: args.url,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i80.HasilAnalisaPinjamanViewRitel: (data) {
      final args =
          data.getArgs<HasilAnalisaPinjamanViewRitelArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i80.HasilAnalisaPinjamanViewRitel(
            key: args.key,
            debiturName: args.debiturName,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable,
            status: args.status),
        settings: data,
      );
    },
    _i81.HasilAnalisaPinjamanSuccessView: (data) {
      final args =
          data.getArgs<HasilAnalisaPinjamanSuccessViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i81.HasilAnalisaPinjamanSuccessView(
            key: args.key,
            debiturName: args.debiturName,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i82.TDPPeroranganViewPari: (data) {
      final args = data.getArgs<TDPPeroranganViewPariArguments>(
        orElse: () => const TDPPeroranganViewPariArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i82.TDPPeroranganViewPari(
            key: args.key,
            pipelineId: args.pipelineId,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            fromTDPViewRitel: args.fromTDPViewRitel,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i83.InformasiDataDiriViewPari: (data) {
      final args =
          data.getArgs<InformasiDataDiriViewPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i83.InformasiDataDiriViewPari(
            key: args.key,
            pipelineId: args.pipelineId,
            fromTdpPeroranganView: args.fromTdpPeroranganView,
            ritelInformasiDataDiri: args.ritelInformasiDataDiri,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i84.InformasiUsahaDebiturPariView: (data) {
      final args =
          data.getArgs<InformasiUsahaDebiturPariViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i84.InformasiUsahaDebiturPariView(
            key: args.key,
            pipelineId: args.pipelineId,
            ritelInformasiUsaha: args.ritelInformasiUsaha,
            fromTdpPeroranganView: args.fromTdpPeroranganView,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i85.InformasiLainnyaPariView: (data) {
      final args =
          data.getArgs<InformasiLainnyaPariViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i85.InformasiLainnyaPariView(
            key: args.key,
            pipelineId: args.pipelineId,
            ritelInformasiLainnya: args.ritelInformasiLainnya,
            fromTdpPeroranganView: args.fromTdpPeroranganView,
            fromPipelineDetailsView: args.fromPipelineDetailsView,
            statusPipeline: args.statusPipeline),
        settings: data,
      );
    },
    _i86.PipelineDetailsViewPari: (data) {
      final args =
          data.getArgs<PipelineDetailsViewPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i86.PipelineDetailsViewPari(
            args.id, args.debiturType, args.statusPipeline,
            key: args.key),
        settings: data,
      );
    },
    _i87.PipelineSuccessViewPari: (data) {
      final args = data.getArgs<PipelineSuccessViewPariArguments>(
        orElse: () => const PipelineSuccessViewPariArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i87.PipelineSuccessViewPari(
            key: args.key,
            pipelineId: args.pipelineId,
            debiturName: args.debiturName),
        settings: data,
      );
    },
    _i88.InformasiAgunanViewPari: (data) {
      final args =
          data.getArgs<InformasiAgunanViewPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i88.InformasiAgunanViewPari(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable,
            status: args.status),
        settings: data,
      );
    },
    _i89.InformasiAgunanTambahanViewPari: (data) {
      final args =
          data.getArgs<InformasiAgunanTambahanViewPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i89.InformasiAgunanTambahanViewPari(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i90.InformasiAgunanTambahanDetailsTanahPari: (data) {
      final args =
          data.getArgs<InformasiAgunanTambahanDetailsTanahPariArguments>(
              nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i90.InformasiAgunanTambahanDetailsTanahPari(
            key: args.key,
            ritelInformasiAgunanTambahanDetailTanah:
                args.ritelInformasiAgunanTambahanDetailTanah,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i91.InformasiAgunanTambahanDetailsTanahBangunanPari: (data) {
      final args = data
          .getArgs<InformasiAgunanTambahanDetailsTanahBangunanPariArguments>(
              nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i91.InformasiAgunanTambahanDetailsTanahBangunanPari(
                key: args.key,
                ritelInformasiAgunanTambahanDetailTanahBangunan:
                    args.ritelInformasiAgunanTambahanDetailTanahBangunan,
                pipelineId: args.pipelineId,
                loanTypesId: args.loanTypesId,
                status: args.status,
                codeTable: args.codeTable),
        settings: data,
      );
    },
    _i92.InformasiAgunanTambahanDetailsMotorPari: (data) {
      final args =
          data.getArgs<InformasiAgunanTambahanDetailsMotorPariArguments>(
              nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i92.InformasiAgunanTambahanDetailsMotorPari(
            key: args.key,
            ritelInformasiAgunanTambahanDetailMotor:
                args.ritelInformasiAgunanTambahanDetailMotor,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i93.InformasiAgunanTambahanDetailsCashCollateralPari: (data) {
      final args = data
          .getArgs<InformasiAgunanTambahanDetailsCashCollateralPariArguments>(
              nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i93.InformasiAgunanTambahanDetailsCashCollateralPari(
                key: args.key,
                ritelInformasiAgunanTambahanDetailCashCollateral:
                    args.ritelInformasiAgunanTambahanDetailCashCollateral,
                pipelineId: args.pipelineId,
                loanTypesId: args.loanTypesId,
                status: args.status,
                codeTable: args.codeTable),
        settings: data,
      );
    },
    _i94.InformasiAgunanTambahanDetailsMesinPari: (data) {
      final args =
          data.getArgs<InformasiAgunanTambahanDetailsMesinPariArguments>(
              nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i94.InformasiAgunanTambahanDetailsMesinPari(
            key: args.key,
            ritelInformasiAgunanTambahanDetailMesin:
                args.ritelInformasiAgunanTambahanDetailMesin,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i95.InformasiAgunanLknDetailsPari: (data) {
      final args =
          data.getArgs<InformasiAgunanLknDetailsPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i95.InformasiAgunanLknDetailsPari(
            key: args.key,
            ritelLaporanKunjunganNasabah: args.ritelLaporanKunjunganNasabah,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i96.InformasiNonFinasialPageOneAPari: (data) {
      final args = data.getArgs<InformasiNonFinasialPageOneAPariArguments>(
          nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i96.InformasiNonFinasialPageOneAPari(
            key: args.key,
            prakarsaId: args.prakarsaId,
            name: args.name,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i97.SummaryInformasiNonFinansialPari: (data) {
      final args = data.getArgs<SummaryInformasiNonFinansialPariArguments>(
          nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i97.SummaryInformasiNonFinansialPari(
            key: args.key,
            fullName: args.fullName,
            summaryNonFinansial: args.summaryNonFinansial,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i98.InformasiPinjamanViewPari: (data) {
      final args =
          data.getArgs<InformasiPinjamanViewPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i98.InformasiPinjamanViewPari(
            key: args.key,
            ritelInformasiPinjaman: args.ritelInformasiPinjaman,
            pipelinesId: args.pipelinesId,
            loanTypesId: args.loanTypesId,
            prakarsaId: args.prakarsaId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i99.InformasiPinjamanDetailsPari: (data) {
      final args =
          data.getArgs<InformasiPinjamanDetailsPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i99.InformasiPinjamanDetailsPari(
            key: args.key,
            ritelInformasiPinjaman: args.ritelInformasiPinjaman,
            pipelinesId: args.pipelinesId,
            loanTypesId: args.loanTypesId,
            prakarsaId: args.prakarsaId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i100.InformasiDebiturPari: (data) {
      final args = data.getArgs<InformasiDebiturPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i100.InformasiDebiturPari(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelinesId: args.pipelinesId,
            backPipeline: args.backPipeline,
            status: args.status),
        settings: data,
      );
    },
    _i101.InformasiFinansialViewPari: (data) {
      final args =
          data.getArgs<InformasiFinansialViewPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i101.InformasiFinansialViewPari(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable,
            status: args.status),
        settings: data,
      );
    },
    _i102.LegalitasUsahaPariView: (data) {
      final args = data.getArgs<LegalitasUsahaPariViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i102.LegalitasUsahaPariView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            ritelPrakarsaPerorangan: args.ritelPrakarsaPerorangan,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i103.TambahDokumenPariView: (data) {
      final args = data.getArgs<TambahDokumenPariViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i103.TambahDokumenPariView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            ritelPrakarsaPerorangan: args.ritelPrakarsaPerorangan,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i104.UpdateDokumenPariView: (data) {
      final args = data.getArgs<UpdateDokumenPariViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i104.UpdateDokumenPariView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            uploadDocFrom: args.uploadDocFrom,
            ritelLegalitasUsahaUtama: args.ritelLegalitasUsahaUtama,
            ritelLegalitasUsahaLainnya: args.ritelLegalitasUsahaLainnya,
            ritelPrakarsaPerorangan: args.ritelPrakarsaPerorangan,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            codeTable: args.codeTable,
            status: args.status),
        settings: data,
      );
    },
    _i105.InformasiFinansialFormPeriodPari: (data) {
      final args = data.getArgs<InformasiFinansialFormPeriodPariArguments>(
          nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i105.InformasiFinansialFormPeriodPari(
            key: args.key,
            prakarsaId: args.prakarsaId,
            isFromForm: args.isFromForm,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status),
        settings: data,
      );
    },
    _i106.MutasiTransaksiPariView: (data) {
      final args =
          data.getArgs<MutasiTransaksiPariViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i106.MutasiTransaksiPariView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            ritelMutasiTransaksiPariModel: args.ritelMutasiTransaksiPariModel,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable,
            fileMutasiTransaksiPari: args.fileMutasiTransaksiPari),
        settings: data,
      );
    },
    _i107.MutasiTransaksiDetail: (data) {
      final args = data.getArgs<MutasiTransaksiDetailArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i107.MutasiTransaksiDetail(
            key: args.key,
            ritelMutasiTransaksiPariModel: args.ritelMutasiTransaksiPariModel,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i108.MutasiRekeningPariView: (data) {
      final args = data.getArgs<MutasiRekeningPariViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i108.MutasiRekeningPariView(
            key: args.key,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable),
        settings: data,
      );
    },
    _i109.MutasiRekeningPariFormView: (data) {
      final args =
          data.getArgs<MutasiRekeningPariFormViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i109.MutasiRekeningPariFormView(
            key: args.key,
            ritelMutasiRekening: args.ritelMutasiRekening,
            prakarsaId: args.prakarsaId,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable,
            index: args.index),
        settings: data,
      );
    },
    _i110.MutasiRekeningDetailsPari: (data) {
      final args =
          data.getArgs<MutasiRekeningDetailsPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i110.MutasiRekeningDetailsPari(
            key: args.key,
            ritelMutasiRekening: args.ritelMutasiRekening,
            ritelMutasiRekeningHeader: args.ritelMutasiRekeningHeader,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable,
            index: args.index),
        settings: data,
      );
    },
    _i111.MutasiRekeningDetailsItemPari: (data) {
      final args =
          data.getArgs<MutasiRekeningDetailsItemPariArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i111.MutasiRekeningDetailsItemPari(
            key: args.key,
            detailMutasi: args.detailMutasi,
            pipelineId: args.pipelineId,
            loanTypesId: args.loanTypesId,
            status: args.status,
            codeTable: args.codeTable,
            prakarsaId: args.prakarsaId),
        settings: data,
      );
    },
    _i112.MonitoringRitelView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i112.MonitoringRitelView(),
        settings: data,
      );
    },
    _i113.MonitoringDetailView: (data) {
      final args = data.getArgs<MonitoringDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i113.MonitoringDetailView(
            idKelolaan: args.idKelolaan,
            loanType: args.loanType,
            key: args.key),
        settings: data,
      );
    },
    _i114.TambahPencairanView: (data) {
      final args = data.getArgs<TambahPencairanViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i114.TambahPencairanView(
            key: args.key,
            step: args.step,
            idKelolaan: args.idKelolaan,
            idPartner: args.idPartner,
            pinjamanDetail: args.pinjamanDetail,
            counter: args.counter,
            status: args.status,
            loanType: args.loanType),
        settings: data,
      );
    },
    _i115.PinjamanDetailView: (data) {
      final args = data.getArgs<PinjamanDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i115.PinjamanDetailView(
            key: args.key,
            counter: args.counter,
            disburseId: args.disburseId,
            status: args.status,
            loanType: args.loanType,
            idKelolaan: args.idKelolaan),
        settings: data,
      );
    },
    _i116.PenurunanPinjamanView: (data) {
      final args = data.getArgs<PenurunanPinjamanViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i116.PenurunanPinjamanView(
            key: args.key, disburseData: args.disburseData),
        settings: data,
      );
    },
    _i117.PenurunanPinjamanSuccessView: (data) {
      final args =
          data.getArgs<PenurunanPinjamanSuccessViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i117.PenurunanPinjamanSuccessView(
            key: args.key, disburseData: args.disburseData),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MainViewArguments {
  const MainViewArguments({
    this.key,
    this.index = 0,
    this.prakarsaTabsIndex = 0,
  });

  final _i118.Key? key;

  final int? index;

  final int? prakarsaTabsIndex;
}

class PipelineViewArguments {
  const PipelineViewArguments({
    this.key,
    this.index,
    required this.bottomPadding,
  });

  final _i118.Key? key;

  final int? index;

  final double bottomPadding;
}

class PrakarsaViewArguments {
  const PrakarsaViewArguments({
    this.key,
    this.index,
    this.prakarsaTabsIndex,
  });

  final _i118.Key? key;

  final int? index;

  final int? prakarsaTabsIndex;
}

class AkunViewArguments {
  const AkunViewArguments({
    this.fromBerandaHeader = false,
    this.key,
  });

  final bool fromBerandaHeader;

  final _i118.Key? key;
}

class StatusKelolaanItemDetailsViewArguments {
  const StatusKelolaanItemDetailsViewArguments({
    this.key,
    required this.statusKelolaanType,
    required this.value,
  });

  final _i118.Key? key;

  final _i119.StatusKelolaanType statusKelolaanType;

  final int value;
}

class PartnershipViewRitelArguments {
  const PartnershipViewRitelArguments({
    this.key,
    this.idKelolaan,
    this.idPartner,
    this.pinjamanDetail,
    this.counter,
    this.status,
    this.loanType,
  });

  final _i118.Key? key;

  final String? idKelolaan;

  final String? idPartner;

  final _i120.MonitoringPinjamanDetail? pinjamanDetail;

  final int? counter;

  final String? status;

  final int? loanType;
}

class TambahPartnershipViewRitelArguments {
  const TambahPartnershipViewRitelArguments({
    this.key,
    this.idKelolaan,
    this.pinjamanDetail,
    this.counter,
    this.status,
    this.loanType,
  });

  final _i118.Key? key;

  final String? idKelolaan;

  final _i120.MonitoringPinjamanDetail? pinjamanDetail;

  final int? counter;

  final String? status;

  final int? loanType;
}

class TDPPeroranganViewRitelArguments {
  const TDPPeroranganViewRitelArguments({
    this.key,
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final bool? fromPipelineDetailsView;

  final bool? fromTDPViewRitel;

  final int? statusPipeline;
}

class InformasiDataDiriViewArguments {
  const InformasiDataDiriViewArguments({
    this.key,
    this.pipelineId,
    required this.fromTdpPeroranganView,
    this.ritelInformasiDataDiri,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final bool fromTdpPeroranganView;

  final _i121.RitelInformasiDataDiri? ritelInformasiDataDiri;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class InformasiUsahaDebiturViewArguments {
  const InformasiUsahaDebiturViewArguments({
    this.key,
    this.pipelineId,
    this.ritelInformasiUsaha,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView = false,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final _i122.RitelInformasiUsaha? ritelInformasiUsaha;

  final bool fromTdpPeroranganView;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class InformasiLainnyaViewArguments {
  const InformasiLainnyaViewArguments({
    this.key,
    this.pipelineId,
    this.ritelInformasiLainnya,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final _i123.RitelInformasiLainnya? ritelInformasiLainnya;

  final bool fromTdpPeroranganView;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class PipelineDetailsViewRitelArguments {
  const PipelineDetailsViewRitelArguments({
    required this.id,
    required this.debiturType,
    required this.statusPipeline,
    this.key,
  });

  final String id;

  final String debiturType;

  final int statusPipeline;

  final _i118.Key? key;
}

class TDPPerusahaanPtViewRitelArguments {
  const TDPPerusahaanPtViewRitelArguments({
    this.key,
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
    this.stepperPengurus = 0,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final bool? fromPipelineDetailsView;

  final bool? fromTDPViewRitel;

  final int? statusPipeline;

  final int? stepperPengurus;
}

class InformasiPerusahaanPtViewArguments {
  const InformasiPerusahaanPtViewArguments({
    this.key,
    this.pipelineId,
    required this.fromTdpPerusahaanPtView,
    this.ritelInformasiPerusahaanPt,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final bool fromTdpPerusahaanPtView;

  final _i124.RitelInformasiPerusahaanPt? ritelInformasiPerusahaanPt;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class InformasiPengurusPtViewArguments {
  const InformasiPengurusPtViewArguments({
    this.key,
    this.pipelineId,
    required this.fromTdpPerusahaanPtView,
    this.fromPipelineDetailsView = false,
    this.statusPipeline,
    this.ritelListPengurusPerusahaan,
    this.nomorPengurus = 0,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final bool fromTdpPerusahaanPtView;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;

  final _i125.RitelListPengurusPerusahaanPTModel? ritelListPengurusPerusahaan;

  final int nomorPengurus;
}

class InformasiLainnyaPtViewArguments {
  const InformasiLainnyaPtViewArguments({
    this.key,
    this.pipelineId,
    this.ritelInformasiLainnyaPt,
    required this.fromTdpPerusahaanPtView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final _i126.RitelInformasiLainnyaPt? ritelInformasiLainnyaPt;

  final bool fromTdpPerusahaanPtView;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class PipelineDetailsPtViewRitelArguments {
  const PipelineDetailsPtViewRitelArguments({
    required this.id,
    required this.debiturType,
    required this.statusPipeline,
    this.key,
  });

  final String id;

  final String debiturType;

  final int statusPipeline;

  final _i118.Key? key;
}

class InformasiPengurusPemilikBoardViewArguments {
  const InformasiPengurusPemilikBoardViewArguments({
    this.key,
    this.pipelineId,
  });

  final _i118.Key? key;

  final String? pipelineId;
}

class HasilPrescreeningViewPerusahaanCVRitelArguments {
  const HasilPrescreeningViewPerusahaanCVRitelArguments({
    this.key,
    required this.pipelineFlagId,
    required this.codeTable,
    this.fromPrakarsaDetails = true,
  });

  final _i118.Key? key;

  final String pipelineFlagId;

  final String codeTable;

  final bool fromPrakarsaDetails;
}

class TDPPerusahaanCvViewRitelArguments {
  const TDPPerusahaanCvViewRitelArguments({
    this.key,
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
    this.stepperPengurus = 0,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final bool? fromPipelineDetailsView;

  final bool? fromTDPViewRitel;

  final int? statusPipeline;

  final int? stepperPengurus;
}

class InformasiPerusahaanCvViewArguments {
  const InformasiPerusahaanCvViewArguments({
    this.key,
    this.pipelineId,
    required this.fromTdpPeroranganView,
    this.ritelInformasiPerusahaanCv,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final bool fromTdpPeroranganView;

  final _i127.RitelInformasiPerusahaanCV? ritelInformasiPerusahaanCv;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class InformasiPengurusCvViewArguments {
  const InformasiPengurusCvViewArguments({
    this.key,
    this.pipelineId,
    this.ritelInformasiPengurusCv,
    this.fromPipelineDetailsView = false,
    this.statusPipeline,
    this.nomorPengurus = 0,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final _i128.RitelListInformasiPengurusPemilikCV? ritelInformasiPengurusCv;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;

  final int nomorPengurus;
}

class InformasiLainnyaCvViewArguments {
  const InformasiLainnyaCvViewArguments({
    this.key,
    this.pipelineId,
    this.ritelInformasiLainnya,
    required this.fromTdpPerusahaanView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final _i129.RitelInformasiLainnyaCv? ritelInformasiLainnya;

  final bool fromTdpPerusahaanView;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class PipelineDetailsCvViewRitelArguments {
  const PipelineDetailsCvViewRitelArguments({
    required this.id,
    required this.debiturType,
    required this.statusPipeline,
    required this.codeTable,
    this.key,
  });

  final String id;

  final String debiturType;

  final int statusPipeline;

  final int codeTable;

  final _i118.Key? key;
}

class PipelineSuccessViewRitelArguments {
  const PipelineSuccessViewRitelArguments({
    this.key,
    this.pipelineId,
    this.debiturName,
    this.codeTable,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final String? debiturName;

  final int? codeTable;
}

class InformasiPengurusPemilikBoardCvViewArguments {
  const InformasiPengurusPemilikBoardCvViewArguments({
    this.key,
    this.pipelineId,
  });

  final _i118.Key? key;

  final String? pipelineId;
}

class PrakarsaDetailsViewRitelArguments {
  const PrakarsaDetailsViewRitelArguments({
    this.key,
    this.index = 0,
    required this.prakarsaId,
    required this.pipelineId,
    this.loanTypesId,
    this.codeTable,
  });

  final _i118.Key? key;

  final int? index;

  final String prakarsaId;

  final String pipelineId;

  final int? loanTypesId;

  final int? codeTable;
}

class InformasiDebiturViewArguments {
  const InformasiDebiturViewArguments({
    this.key,
    required this.pipelinesId,
    required this.prakarsaId,
    this.backPipeline = false,
    required this.status,
  });

  final _i118.Key? key;

  final String pipelinesId;

  final String prakarsaId;

  final bool backPipeline;

  final int status;
}

class InformasiPerusahaanViewArguments {
  const InformasiPerusahaanViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int status;

  final int codeTable;
}

class InformasiPengurusViewArguments {
  const InformasiPengurusViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int status;

  final int codeTable;
}

class LegalitasUsahaViewArguments {
  const LegalitasUsahaViewArguments({
    this.key,
    required this.prakarsaId,
    required this.ritelPrakarsaPerorangan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class LegalitasUsahaPerusahaanPtViewArguments {
  const LegalitasUsahaPerusahaanPtViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class LegalitasUsahaPerusahaanCvViewArguments {
  const LegalitasUsahaPerusahaanCvViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class TambahDokumenViewArguments {
  const TambahDokumenViewArguments({
    this.key,
    required this.prakarsaId,
    required this.ritelPrakarsaPerorangan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;
}

class UpdateDokumenViewArguments {
  const UpdateDokumenViewArguments({
    this.key,
    required this.prakarsaId,
    required this.uploadDocFrom,
    this.ritelLegalitasUsahaUtama,
    this.ritelLegalitasUsahaLainnya,
    required this.ritelPrakarsaPerorangan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final int uploadDocFrom;

  final _i131.RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama;

  final _i132.RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya;

  final _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class TambahDokumenPerusahaanPtViewArguments {
  const TambahDokumenPerusahaanPtViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;
}

class UpdateDokumenPerusahaanPtViewArguments {
  const UpdateDokumenPerusahaanPtViewArguments({
    this.key,
    required this.prakarsaId,
    required this.uploadDocFrom,
    this.ritelLegalitasUsahaUtama,
    this.ritelLegalitasUsahaLainnya,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final int uploadDocFrom;

  final _i131.RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama;

  final _i132.RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class TambahDokumenPerusahaanCvViewArguments {
  const TambahDokumenPerusahaanCvViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;
}

class UpdateDokumenPerusahaanCvViewArguments {
  const UpdateDokumenPerusahaanCvViewArguments({
    this.key,
    required this.prakarsaId,
    required this.uploadDocFrom,
    this.ritelLegalitasUsahaUtama,
    this.ritelLegalitasUsahaLainnya,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final int uploadDocFrom;

  final _i131.RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama;

  final _i132.RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class HasilPrescreeningViewRitelArguments {
  const HasilPrescreeningViewRitelArguments({
    this.key,
    this.pipelineflagId,
    this.name,
    this.ktpNum,
    this.fromPrakarsaDetails,
  });

  final _i118.Key? key;

  final String? pipelineflagId;

  final String? name;

  final String? ktpNum;

  final bool? fromPrakarsaDetails;
}

class InformasiFinansialViewArguments {
  const InformasiFinansialViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiFinansialViewPeriodOneArguments {
  const InformasiFinansialViewPeriodOneArguments({
    this.key,
    this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String? prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiFinansialFormPeriodOneArguments {
  const InformasiFinansialFormPeriodOneArguments({
    this.key,
    this.prakarsaId,
    this.isFromForm = false,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String? prakarsaId;

  final bool isFromForm;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class MutasiRekeningViewArguments {
  const MutasiRekeningViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class MutasiRekeningFormViewArguments {
  const MutasiRekeningFormViewArguments({
    this.key,
    this.ritelMutasiRekening,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.index,
  });

  final _i118.Key? key;

  final _i133.RitelMutasiRekening? ritelMutasiRekening;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;

  final int? index;
}

class MutasiRekeningDetailsArguments {
  const MutasiRekeningDetailsArguments({
    this.key,
    required this.ritelMutasiRekening,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.index,
  });

  final _i118.Key? key;

  final _i133.RitelMutasiRekening ritelMutasiRekening;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;

  final int? index;
}

class InformasiNonFinasialPageOneAArguments {
  const InformasiNonFinasialPageOneAArguments({
    this.key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String name;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;
}

class SummaryInformasiNonFinansialArguments {
  const SummaryInformasiNonFinansialArguments({
    this.key,
    required this.fullName,
    required this.summaryNonFinansial,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String fullName;

  final _i134.RitelSummaryNonFinansial summaryNonFinansial;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;
}

class InformasiAgunanViewRitelArguments {
  const InformasiAgunanViewRitelArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanViewArguments {
  const InformasiAgunanTambahanViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsTanahArguments {
  const InformasiAgunanTambahanDetailsTanahArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailTanah,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i135.RitelInformasiAgunanTambahanDetailTanah
      ritelInformasiAgunanTambahanDetailTanah;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsTanahBangunanArguments {
  const InformasiAgunanTambahanDetailsTanahBangunanArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailTanahBangunan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i136.RitelInformasiAgunanTambahanDetailTanahBangunan
      ritelInformasiAgunanTambahanDetailTanahBangunan;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsMotorArguments {
  const InformasiAgunanTambahanDetailsMotorArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailMotor,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i137.RitelInformasiAgunanTambahanDetailMotor
      ritelInformasiAgunanTambahanDetailMotor;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsCashCollateralArguments {
  const InformasiAgunanTambahanDetailsCashCollateralArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailCashCollateral,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i138.RitelInformasiAgunanTambahanDetailCashCollateral
      ritelInformasiAgunanTambahanDetailCashCollateral;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsMesinArguments {
  const InformasiAgunanTambahanDetailsMesinArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailMesin,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i139.RitelInformasiAgunanTambahanDetailMesin
      ritelInformasiAgunanTambahanDetailMesin;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanLKNViewArguments {
  const InformasiAgunanLKNViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanLknDetailsArguments {
  const InformasiAgunanLknDetailsArguments({
    this.key,
    required this.ritelLaporanKunjunganNasabah,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i140.RitelLaporanKunjunganNasabah ritelLaporanKunjunganNasabah;

  final int status;

  final int codeTable;
}

class InformasiAgunanLknFormArguments {
  const InformasiAgunanLknFormArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    this.ritelLaporanKunjunganNasabah,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final _i140.RitelLaporanKunjunganNasabah? ritelLaporanKunjunganNasabah;

  final int status;

  final int codeTable;
}

class InformasiPinjamanViewRitelArguments {
  const InformasiPinjamanViewRitelArguments({
    this.key,
    required this.ritelInformasiPinjaman,
    required this.pipelinesId,
    required this.loanTypesId,
    required this.prakarsaId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i141.RitelInformasiPinjaman ritelInformasiPinjaman;

  final String pipelinesId;

  final int loanTypesId;

  final String prakarsaId;

  final int codeTable;
}

class InformasiPinjamanDetailsRitelArguments {
  const InformasiPinjamanDetailsRitelArguments({
    this.key,
    required this.ritelInformasiPinjaman,
    required this.pipelinesId,
    required this.loanTypesId,
    required this.prakarsaId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i141.RitelInformasiPinjaman ritelInformasiPinjaman;

  final String pipelinesId;

  final int loanTypesId;

  final String prakarsaId;

  final int status;

  final int codeTable;
}

class RiwayatProjekViewArguments {
  const RiwayatProjekViewArguments({
    this.key,
    required this.prakarsaId,
    this.ritelRiwayatProjek,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final _i142.RitelRiwayatProjek? ritelRiwayatProjek;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class TradeCheckingViewArguments {
  const TradeCheckingViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class TradeCheckingDetailsArguments {
  const TradeCheckingDetailsArguments({
    this.key,
    required this.ritelTradeChecking,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i143.RitelTradeChecking ritelTradeChecking;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class RiwayatProjekDetailsArguments {
  const RiwayatProjekDetailsArguments({
    this.key,
    required this.ritelRiwayatProjek,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i142.RitelRiwayatProjek ritelRiwayatProjek;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class UploadCRRViewArguments {
  const UploadCRRViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.url,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;

  final String? url;
}

class UploadCRRDetailsArguments {
  const UploadCRRDetailsArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.url,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final String url;

  final int status;

  final int codeTable;
}

class HasilAnalisaPinjamanViewRitelArguments {
  const HasilAnalisaPinjamanViewRitelArguments({
    this.key,
    required this.debiturName,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    this.status,
  });

  final _i118.Key? key;

  final String debiturName;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;

  final int? status;
}

class HasilAnalisaPinjamanSuccessViewArguments {
  const HasilAnalisaPinjamanSuccessViewArguments({
    this.key,
    required this.debiturName,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String debiturName;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;
}

class TDPPeroranganViewPariArguments {
  const TDPPeroranganViewPariArguments({
    this.key,
    this.pipelineId,
    this.fromPipelineDetailsView = false,
    this.fromTDPViewRitel = false,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final bool? fromPipelineDetailsView;

  final bool? fromTDPViewRitel;

  final int? statusPipeline;
}

class InformasiDataDiriViewPariArguments {
  const InformasiDataDiriViewPariArguments({
    this.key,
    this.pipelineId,
    required this.fromTdpPeroranganView,
    this.ritelInformasiDataDiri,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final bool fromTdpPeroranganView;

  final _i121.RitelInformasiDataDiri? ritelInformasiDataDiri;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class InformasiUsahaDebiturPariViewArguments {
  const InformasiUsahaDebiturPariViewArguments({
    this.key,
    this.pipelineId,
    this.ritelInformasiUsaha,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView = false,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final _i122.RitelInformasiUsaha? ritelInformasiUsaha;

  final bool fromTdpPeroranganView;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class InformasiLainnyaPariViewArguments {
  const InformasiLainnyaPariViewArguments({
    this.key,
    this.pipelineId,
    this.ritelInformasiLainnya,
    required this.fromTdpPeroranganView,
    this.fromPipelineDetailsView,
    this.statusPipeline,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final _i123.RitelInformasiLainnya? ritelInformasiLainnya;

  final bool fromTdpPeroranganView;

  final bool? fromPipelineDetailsView;

  final int? statusPipeline;
}

class PipelineDetailsViewPariArguments {
  const PipelineDetailsViewPariArguments({
    required this.id,
    required this.debiturType,
    required this.statusPipeline,
    this.key,
  });

  final String id;

  final String debiturType;

  final int statusPipeline;

  final _i118.Key? key;
}

class PipelineSuccessViewPariArguments {
  const PipelineSuccessViewPariArguments({
    this.key,
    this.pipelineId,
    this.debiturName,
  });

  final _i118.Key? key;

  final String? pipelineId;

  final String? debiturName;
}

class InformasiAgunanViewPariArguments {
  const InformasiAgunanViewPariArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;

  final int status;
}

class InformasiAgunanTambahanViewPariArguments {
  const InformasiAgunanTambahanViewPariArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsTanahPariArguments {
  const InformasiAgunanTambahanDetailsTanahPariArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailTanah,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i135.RitelInformasiAgunanTambahanDetailTanah
      ritelInformasiAgunanTambahanDetailTanah;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsTanahBangunanPariArguments {
  const InformasiAgunanTambahanDetailsTanahBangunanPariArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailTanahBangunan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i136.RitelInformasiAgunanTambahanDetailTanahBangunan
      ritelInformasiAgunanTambahanDetailTanahBangunan;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsMotorPariArguments {
  const InformasiAgunanTambahanDetailsMotorPariArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailMotor,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i137.RitelInformasiAgunanTambahanDetailMotor
      ritelInformasiAgunanTambahanDetailMotor;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsCashCollateralPariArguments {
  const InformasiAgunanTambahanDetailsCashCollateralPariArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailCashCollateral,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i138.RitelInformasiAgunanTambahanDetailCashCollateral
      ritelInformasiAgunanTambahanDetailCashCollateral;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanTambahanDetailsMesinPariArguments {
  const InformasiAgunanTambahanDetailsMesinPariArguments({
    this.key,
    required this.ritelInformasiAgunanTambahanDetailMesin,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i139.RitelInformasiAgunanTambahanDetailMesin
      ritelInformasiAgunanTambahanDetailMesin;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class InformasiAgunanLknDetailsPariArguments {
  const InformasiAgunanLknDetailsPariArguments({
    this.key,
    required this.ritelLaporanKunjunganNasabah,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i140.RitelLaporanKunjunganNasabah ritelLaporanKunjunganNasabah;

  final int status;

  final int codeTable;
}

class InformasiNonFinasialPageOneAPariArguments {
  const InformasiNonFinasialPageOneAPariArguments({
    this.key,
    required this.prakarsaId,
    required this.name,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String name;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;
}

class SummaryInformasiNonFinansialPariArguments {
  const SummaryInformasiNonFinansialPariArguments({
    this.key,
    required this.fullName,
    required this.summaryNonFinansial,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String fullName;

  final _i134.RitelSummaryNonFinansial summaryNonFinansial;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;
}

class InformasiPinjamanViewPariArguments {
  const InformasiPinjamanViewPariArguments({
    this.key,
    required this.ritelInformasiPinjaman,
    required this.pipelinesId,
    required this.loanTypesId,
    required this.prakarsaId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i141.RitelInformasiPinjaman ritelInformasiPinjaman;

  final String pipelinesId;

  final int loanTypesId;

  final String prakarsaId;

  final int codeTable;
}

class InformasiPinjamanDetailsPariArguments {
  const InformasiPinjamanDetailsPariArguments({
    this.key,
    required this.ritelInformasiPinjaman,
    required this.pipelinesId,
    required this.loanTypesId,
    required this.prakarsaId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i141.RitelInformasiPinjaman ritelInformasiPinjaman;

  final String pipelinesId;

  final int loanTypesId;

  final String prakarsaId;

  final int status;

  final int codeTable;
}

class InformasiDebiturPariArguments {
  const InformasiDebiturPariArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelinesId,
    this.backPipeline = false,
    required this.status,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelinesId;

  final bool backPipeline;

  final int status;
}

class InformasiFinansialViewPariArguments {
  const InformasiFinansialViewPariArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;

  final int status;
}

class LegalitasUsahaPariViewArguments {
  const LegalitasUsahaPariViewArguments({
    this.key,
    required this.prakarsaId,
    required this.ritelPrakarsaPerorangan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class TambahDokumenPariViewArguments {
  const TambahDokumenPariViewArguments({
    this.key,
    required this.prakarsaId,
    required this.ritelPrakarsaPerorangan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;
}

class UpdateDokumenPariViewArguments {
  const UpdateDokumenPariViewArguments({
    this.key,
    required this.prakarsaId,
    required this.uploadDocFrom,
    this.ritelLegalitasUsahaUtama,
    this.ritelLegalitasUsahaLainnya,
    required this.ritelPrakarsaPerorangan,
    required this.pipelineId,
    required this.loanTypesId,
    required this.codeTable,
    required this.status,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final int uploadDocFrom;

  final _i131.RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama;

  final _i132.RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya;

  final _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan;

  final String pipelineId;

  final int loanTypesId;

  final int codeTable;

  final int status;
}

class InformasiFinansialFormPeriodPariArguments {
  const InformasiFinansialFormPeriodPariArguments({
    this.key,
    this.prakarsaId,
    this.isFromForm = false,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
  });

  final _i118.Key? key;

  final String? prakarsaId;

  final bool isFromForm;

  final String pipelineId;

  final int loanTypesId;

  final int status;
}

class MutasiTransaksiPariViewArguments {
  const MutasiTransaksiPariViewArguments({
    this.key,
    required this.prakarsaId,
    this.ritelMutasiTransaksiPariModel,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.fileMutasiTransaksiPari,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final _i144.RitelMutasiTransaksiPariModel? ritelMutasiTransaksiPariModel;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;

  final _i145.PlatformFile? fileMutasiTransaksiPari;
}

class MutasiTransaksiDetailArguments {
  const MutasiTransaksiDetailArguments({
    this.key,
    required this.ritelMutasiTransaksiPariModel,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final _i144.RitelMutasiTransaksiPariModel ritelMutasiTransaksiPariModel;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class MutasiRekeningPariViewArguments {
  const MutasiRekeningPariViewArguments({
    this.key,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
  });

  final _i118.Key? key;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;
}

class MutasiRekeningPariFormViewArguments {
  const MutasiRekeningPariFormViewArguments({
    this.key,
    this.ritelMutasiRekening,
    required this.prakarsaId,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.index,
  });

  final _i118.Key? key;

  final _i133.RitelMutasiRekening? ritelMutasiRekening;

  final String prakarsaId;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;

  final int? index;
}

class MutasiRekeningDetailsPariArguments {
  const MutasiRekeningDetailsPariArguments({
    this.key,
    required this.ritelMutasiRekening,
    this.ritelMutasiRekeningHeader,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    this.index,
  });

  final _i118.Key? key;

  final _i133.RitelMutasiRekening ritelMutasiRekening;

  final _i146.RitelMutasiRekeningHeader? ritelMutasiRekeningHeader;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;

  final int? index;
}

class MutasiRekeningDetailsItemPariArguments {
  const MutasiRekeningDetailsItemPariArguments({
    this.key,
    required this.detailMutasi,
    required this.pipelineId,
    required this.loanTypesId,
    required this.status,
    required this.codeTable,
    required this.prakarsaId,
  });

  final _i118.Key? key;

  final _i133.DetailMutasi detailMutasi;

  final String pipelineId;

  final int loanTypesId;

  final int status;

  final int codeTable;

  final String prakarsaId;
}

class MonitoringDetailViewArguments {
  const MonitoringDetailViewArguments({
    required this.idKelolaan,
    required this.loanType,
    this.key,
  });

  final String idKelolaan;

  final int loanType;

  final _i118.Key? key;
}

class TambahPencairanViewArguments {
  const TambahPencairanViewArguments({
    this.key,
    required this.step,
    this.idKelolaan,
    this.idPartner,
    this.pinjamanDetail,
    this.counter,
    this.status,
    this.loanType,
  });

  final _i118.Key? key;

  final int step;

  final String? idKelolaan;

  final String? idPartner;

  final _i120.MonitoringPinjamanDetail? pinjamanDetail;

  final int? counter;

  final String? status;

  final int? loanType;
}

class PinjamanDetailViewArguments {
  const PinjamanDetailViewArguments({
    this.key,
    required this.counter,
    required this.disburseId,
    required this.status,
    required this.loanType,
    required this.idKelolaan,
  });

  final _i118.Key? key;

  final int counter;

  final int disburseId;

  final String status;

  final int loanType;

  final String idKelolaan;
}

class PenurunanPinjamanViewArguments {
  const PenurunanPinjamanViewArguments({
    this.key,
    required this.disburseData,
  });

  final _i118.Key? key;

  final Map<String, dynamic> disburseData;
}

class PenurunanPinjamanSuccessViewArguments {
  const PenurunanPinjamanSuccessViewArguments({
    this.key,
    required this.disburseData,
  });

  final _i118.Key? key;

  final Map<String, dynamic> disburseData;
}

extension NavigatorStateExtension on _i147.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView({
    _i118.Key? key,
    int? index = 0,
    int? prakarsaTabsIndex = 0,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mainView,
        arguments: MainViewArguments(
            key: key, index: index, prakarsaTabsIndex: prakarsaTabsIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBerandaView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.berandaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPipelineView({
    _i118.Key? key,
    int? index,
    required double bottomPadding,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pipelineView,
        arguments: PipelineViewArguments(
            key: key, index: index, bottomPadding: bottomPadding),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPrakarsaView({
    _i118.Key? key,
    int? index,
    int? prakarsaTabsIndex,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.prakarsaView,
        arguments: PrakarsaViewArguments(
            key: key, index: index, prakarsaTabsIndex: prakarsaTabsIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddressSelectionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addressSelectionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAkunView({
    bool fromBerandaHeader = false,
    _i118.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.akunView,
        arguments:
            AkunViewArguments(fromBerandaHeader: fromBerandaHeader, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToServerMaintenance([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.serverMaintenance,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNoNetwork([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.noNetwork,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGuidedCameraView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.guidedCameraView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPribadiView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.informasiPribadiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBantuanView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.bantuanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSyaratKetentuanView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.syaratKetentuanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKebijakanPrivasiView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kebijakanPrivasiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStatusKelolaanItemDetailsView({
    _i118.Key? key,
    required _i119.StatusKelolaanType statusKelolaanType,
    required int value,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.statusKelolaanItemDetailsView,
        arguments: StatusKelolaanItemDetailsViewArguments(
            key: key, statusKelolaanType: statusKelolaanType, value: value),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPartnershipViewRitel({
    _i118.Key? key,
    String? idKelolaan,
    String? idPartner,
    _i120.MonitoringPinjamanDetail? pinjamanDetail,
    int? counter,
    String? status,
    int? loanType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.partnershipViewRitel,
        arguments: PartnershipViewRitelArguments(
            key: key,
            idKelolaan: idKelolaan,
            idPartner: idPartner,
            pinjamanDetail: pinjamanDetail,
            counter: counter,
            status: status,
            loanType: loanType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTambahPartnershipViewRitel({
    _i118.Key? key,
    String? idKelolaan,
    _i120.MonitoringPinjamanDetail? pinjamanDetail,
    int? counter,
    String? status,
    int? loanType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tambahPartnershipViewRitel,
        arguments: TambahPartnershipViewRitelArguments(
            key: key,
            idKelolaan: idKelolaan,
            pinjamanDetail: pinjamanDetail,
            counter: counter,
            status: status,
            loanType: loanType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTDPViewRitel([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.tDPViewRitel,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTDPPeroranganViewRitel({
    _i118.Key? key,
    String? pipelineId,
    bool? fromPipelineDetailsView = false,
    bool? fromTDPViewRitel = false,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tDPPeroranganViewRitel,
        arguments: TDPPeroranganViewRitelArguments(
            key: key,
            pipelineId: pipelineId,
            fromPipelineDetailsView: fromPipelineDetailsView,
            fromTDPViewRitel: fromTDPViewRitel,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiDataDiriView({
    _i118.Key? key,
    String? pipelineId,
    required bool fromTdpPeroranganView,
    _i121.RitelInformasiDataDiri? ritelInformasiDataDiri,
    bool? fromPipelineDetailsView,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiDataDiriView,
        arguments: InformasiDataDiriViewArguments(
            key: key,
            pipelineId: pipelineId,
            fromTdpPeroranganView: fromTdpPeroranganView,
            ritelInformasiDataDiri: ritelInformasiDataDiri,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiUsahaDebiturView({
    _i118.Key? key,
    String? pipelineId,
    _i122.RitelInformasiUsaha? ritelInformasiUsaha,
    required bool fromTdpPeroranganView,
    bool? fromPipelineDetailsView = false,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiUsahaDebiturView,
        arguments: InformasiUsahaDebiturViewArguments(
            key: key,
            pipelineId: pipelineId,
            ritelInformasiUsaha: ritelInformasiUsaha,
            fromTdpPeroranganView: fromTdpPeroranganView,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiLainnyaView({
    _i118.Key? key,
    String? pipelineId,
    _i123.RitelInformasiLainnya? ritelInformasiLainnya,
    required bool fromTdpPeroranganView,
    bool? fromPipelineDetailsView,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiLainnyaView,
        arguments: InformasiLainnyaViewArguments(
            key: key,
            pipelineId: pipelineId,
            ritelInformasiLainnya: ritelInformasiLainnya,
            fromTdpPeroranganView: fromTdpPeroranganView,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPipelineDetailsViewRitel({
    required String id,
    required String debiturType,
    required int statusPipeline,
    _i118.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pipelineDetailsViewRitel,
        arguments: PipelineDetailsViewRitelArguments(
            id: id,
            debiturType: debiturType,
            statusPipeline: statusPipeline,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTDPPerusahaanPtViewRitel({
    _i118.Key? key,
    String? pipelineId,
    bool? fromPipelineDetailsView = false,
    bool? fromTDPViewRitel = false,
    int? statusPipeline,
    int? stepperPengurus = 0,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tDPPerusahaanPtViewRitel,
        arguments: TDPPerusahaanPtViewRitelArguments(
            key: key,
            pipelineId: pipelineId,
            fromPipelineDetailsView: fromPipelineDetailsView,
            fromTDPViewRitel: fromTDPViewRitel,
            statusPipeline: statusPipeline,
            stepperPengurus: stepperPengurus),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPerusahaanPtView({
    _i118.Key? key,
    String? pipelineId,
    required bool fromTdpPerusahaanPtView,
    _i124.RitelInformasiPerusahaanPt? ritelInformasiPerusahaanPt,
    bool? fromPipelineDetailsView,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPerusahaanPtView,
        arguments: InformasiPerusahaanPtViewArguments(
            key: key,
            pipelineId: pipelineId,
            fromTdpPerusahaanPtView: fromTdpPerusahaanPtView,
            ritelInformasiPerusahaanPt: ritelInformasiPerusahaanPt,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPengurusPtView({
    _i118.Key? key,
    String? pipelineId,
    required bool fromTdpPerusahaanPtView,
    bool? fromPipelineDetailsView = false,
    int? statusPipeline,
    _i125.RitelListPengurusPerusahaanPTModel? ritelListPengurusPerusahaan,
    int nomorPengurus = 0,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPengurusPtView,
        arguments: InformasiPengurusPtViewArguments(
            key: key,
            pipelineId: pipelineId,
            fromTdpPerusahaanPtView: fromTdpPerusahaanPtView,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline,
            ritelListPengurusPerusahaan: ritelListPengurusPerusahaan,
            nomorPengurus: nomorPengurus),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiLainnyaPtView({
    _i118.Key? key,
    String? pipelineId,
    _i126.RitelInformasiLainnyaPt? ritelInformasiLainnyaPt,
    required bool fromTdpPerusahaanPtView,
    bool? fromPipelineDetailsView,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiLainnyaPtView,
        arguments: InformasiLainnyaPtViewArguments(
            key: key,
            pipelineId: pipelineId,
            ritelInformasiLainnyaPt: ritelInformasiLainnyaPt,
            fromTdpPerusahaanPtView: fromTdpPerusahaanPtView,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPipelineDetailsPtViewRitel({
    required String id,
    required String debiturType,
    required int statusPipeline,
    _i118.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pipelineDetailsPtViewRitel,
        arguments: PipelineDetailsPtViewRitelArguments(
            id: id,
            debiturType: debiturType,
            statusPipeline: statusPipeline,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPengurusPemilikBoardView({
    _i118.Key? key,
    String? pipelineId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPengurusPemilikBoardView,
        arguments: InformasiPengurusPemilikBoardViewArguments(
            key: key, pipelineId: pipelineId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHasilPrescreeningViewPerusahaanCVRitel({
    _i118.Key? key,
    required String pipelineFlagId,
    required String codeTable,
    bool fromPrakarsaDetails = true,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.hasilPrescreeningViewPerusahaanCVRitel,
        arguments: HasilPrescreeningViewPerusahaanCVRitelArguments(
            key: key,
            pipelineFlagId: pipelineFlagId,
            codeTable: codeTable,
            fromPrakarsaDetails: fromPrakarsaDetails),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTDPPerusahaanCvViewRitel({
    _i118.Key? key,
    String? pipelineId,
    bool? fromPipelineDetailsView = false,
    bool? fromTDPViewRitel = false,
    int? statusPipeline,
    int? stepperPengurus = 0,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tDPPerusahaanCvViewRitel,
        arguments: TDPPerusahaanCvViewRitelArguments(
            key: key,
            pipelineId: pipelineId,
            fromPipelineDetailsView: fromPipelineDetailsView,
            fromTDPViewRitel: fromTDPViewRitel,
            statusPipeline: statusPipeline,
            stepperPengurus: stepperPengurus),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPerusahaanCvView({
    _i118.Key? key,
    String? pipelineId,
    required bool fromTdpPeroranganView,
    _i127.RitelInformasiPerusahaanCV? ritelInformasiPerusahaanCv,
    bool? fromPipelineDetailsView,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPerusahaanCvView,
        arguments: InformasiPerusahaanCvViewArguments(
            key: key,
            pipelineId: pipelineId,
            fromTdpPeroranganView: fromTdpPeroranganView,
            ritelInformasiPerusahaanCv: ritelInformasiPerusahaanCv,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPengurusCvView({
    _i118.Key? key,
    String? pipelineId,
    _i128.RitelListInformasiPengurusPemilikCV? ritelInformasiPengurusCv,
    bool? fromPipelineDetailsView = false,
    int? statusPipeline,
    int nomorPengurus = 0,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPengurusCvView,
        arguments: InformasiPengurusCvViewArguments(
            key: key,
            pipelineId: pipelineId,
            ritelInformasiPengurusCv: ritelInformasiPengurusCv,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline,
            nomorPengurus: nomorPengurus),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiLainnyaCvView({
    _i118.Key? key,
    String? pipelineId,
    _i129.RitelInformasiLainnyaCv? ritelInformasiLainnya,
    required bool fromTdpPerusahaanView,
    bool? fromPipelineDetailsView,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiLainnyaCvView,
        arguments: InformasiLainnyaCvViewArguments(
            key: key,
            pipelineId: pipelineId,
            ritelInformasiLainnya: ritelInformasiLainnya,
            fromTdpPerusahaanView: fromTdpPerusahaanView,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPipelineDetailsCvViewRitel({
    required String id,
    required String debiturType,
    required int statusPipeline,
    required int codeTable,
    _i118.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pipelineDetailsCvViewRitel,
        arguments: PipelineDetailsCvViewRitelArguments(
            id: id,
            debiturType: debiturType,
            statusPipeline: statusPipeline,
            codeTable: codeTable,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPipelineSuccessViewRitel({
    _i118.Key? key,
    String? pipelineId,
    String? debiturName,
    int? codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pipelineSuccessViewRitel,
        arguments: PipelineSuccessViewRitelArguments(
            key: key,
            pipelineId: pipelineId,
            debiturName: debiturName,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPengurusPemilikBoardCvView({
    _i118.Key? key,
    String? pipelineId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPengurusPemilikBoardCvView,
        arguments: InformasiPengurusPemilikBoardCvViewArguments(
            key: key, pipelineId: pipelineId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPrakarsaDetailsViewRitel({
    _i118.Key? key,
    int? index = 0,
    required String prakarsaId,
    required String pipelineId,
    int? loanTypesId,
    int? codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.prakarsaDetailsViewRitel,
        arguments: PrakarsaDetailsViewRitelArguments(
            key: key,
            index: index,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiDebiturView({
    _i118.Key? key,
    required String pipelinesId,
    required String prakarsaId,
    bool backPipeline = false,
    required int status,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiDebiturView,
        arguments: InformasiDebiturViewArguments(
            key: key,
            pipelinesId: pipelinesId,
            prakarsaId: prakarsaId,
            backPipeline: backPipeline,
            status: status),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPerusahaanView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPerusahaanView,
        arguments: InformasiPerusahaanViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPengurusView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPengurusView,
        arguments: InformasiPengurusViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLegalitasUsahaView({
    _i118.Key? key,
    required String prakarsaId,
    required _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.legalitasUsahaView,
        arguments: LegalitasUsahaViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLegalitasUsahaPerusahaanPtView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.legalitasUsahaPerusahaanPtView,
        arguments: LegalitasUsahaPerusahaanPtViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLegalitasUsahaPerusahaanCvView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.legalitasUsahaPerusahaanCvView,
        arguments: LegalitasUsahaPerusahaanCvViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTambahDokumenView({
    _i118.Key? key,
    required String prakarsaId,
    required _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tambahDokumenView,
        arguments: TambahDokumenViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpdateDokumenView({
    _i118.Key? key,
    required String prakarsaId,
    required int uploadDocFrom,
    _i131.RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
    _i132.RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
    required _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.updateDokumenView,
        arguments: UpdateDokumenViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            uploadDocFrom: uploadDocFrom,
            ritelLegalitasUsahaUtama: ritelLegalitasUsahaUtama,
            ritelLegalitasUsahaLainnya: ritelLegalitasUsahaLainnya,
            ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTambahDokumenPerusahaanPtView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tambahDokumenPerusahaanPtView,
        arguments: TambahDokumenPerusahaanPtViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpdateDokumenPerusahaanPtView({
    _i118.Key? key,
    required String prakarsaId,
    required int uploadDocFrom,
    _i131.RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
    _i132.RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.updateDokumenPerusahaanPtView,
        arguments: UpdateDokumenPerusahaanPtViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            uploadDocFrom: uploadDocFrom,
            ritelLegalitasUsahaUtama: ritelLegalitasUsahaUtama,
            ritelLegalitasUsahaLainnya: ritelLegalitasUsahaLainnya,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTambahDokumenPerusahaanCvView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tambahDokumenPerusahaanCvView,
        arguments: TambahDokumenPerusahaanCvViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpdateDokumenPerusahaanCvView({
    _i118.Key? key,
    required String prakarsaId,
    required int uploadDocFrom,
    _i131.RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
    _i132.RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.updateDokumenPerusahaanCvView,
        arguments: UpdateDokumenPerusahaanCvViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            uploadDocFrom: uploadDocFrom,
            ritelLegalitasUsahaUtama: ritelLegalitasUsahaUtama,
            ritelLegalitasUsahaLainnya: ritelLegalitasUsahaLainnya,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHasilPrescreeningViewRitel({
    _i118.Key? key,
    String? pipelineflagId,
    String? name,
    String? ktpNum,
    bool? fromPrakarsaDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.hasilPrescreeningViewRitel,
        arguments: HasilPrescreeningViewRitelArguments(
            key: key,
            pipelineflagId: pipelineflagId,
            name: name,
            ktpNum: ktpNum,
            fromPrakarsaDetails: fromPrakarsaDetails),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiFinansialView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiFinansialView,
        arguments: InformasiFinansialViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiFinansialViewPeriodOne({
    _i118.Key? key,
    String? prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiFinansialViewPeriodOne,
        arguments: InformasiFinansialViewPeriodOneArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiFinansialFormPeriodOne({
    _i118.Key? key,
    String? prakarsaId,
    bool isFromForm = false,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiFinansialFormPeriodOne,
        arguments: InformasiFinansialFormPeriodOneArguments(
            key: key,
            prakarsaId: prakarsaId,
            isFromForm: isFromForm,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMutasiRekeningView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mutasiRekeningView,
        arguments: MutasiRekeningViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMutasiRekeningFormView({
    _i118.Key? key,
    _i133.RitelMutasiRekening? ritelMutasiRekening,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mutasiRekeningFormView,
        arguments: MutasiRekeningFormViewArguments(
            key: key,
            ritelMutasiRekening: ritelMutasiRekening,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
            index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMutasiRekeningDetails({
    _i118.Key? key,
    required _i133.RitelMutasiRekening ritelMutasiRekening,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mutasiRekeningDetails,
        arguments: MutasiRekeningDetailsArguments(
            key: key,
            ritelMutasiRekening: ritelMutasiRekening,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
            index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiNonFinasialPageOneA({
    _i118.Key? key,
    required String prakarsaId,
    required String name,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiNonFinasialPageOneA,
        arguments: InformasiNonFinasialPageOneAArguments(
            key: key,
            prakarsaId: prakarsaId,
            name: name,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSummaryInformasiNonFinansial({
    _i118.Key? key,
    required String fullName,
    required _i134.RitelSummaryNonFinansial summaryNonFinansial,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.summaryInformasiNonFinansial,
        arguments: SummaryInformasiNonFinansialArguments(
            key: key,
            fullName: fullName,
            summaryNonFinansial: summaryNonFinansial,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanViewRitel({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanViewRitel,
        arguments: InformasiAgunanViewRitelArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanTambahanView,
        arguments: InformasiAgunanTambahanViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsTanah({
    _i118.Key? key,
    required _i135.RitelInformasiAgunanTambahanDetailTanah
        ritelInformasiAgunanTambahanDetailTanah,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanTambahanDetailsTanah,
        arguments: InformasiAgunanTambahanDetailsTanahArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailTanah:
                ritelInformasiAgunanTambahanDetailTanah,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsTanahBangunan({
    _i118.Key? key,
    required _i136.RitelInformasiAgunanTambahanDetailTanahBangunan
        ritelInformasiAgunanTambahanDetailTanahBangunan,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
        Routes.informasiAgunanTambahanDetailsTanahBangunan,
        arguments: InformasiAgunanTambahanDetailsTanahBangunanArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailTanahBangunan:
                ritelInformasiAgunanTambahanDetailTanahBangunan,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsMotor({
    _i118.Key? key,
    required _i137.RitelInformasiAgunanTambahanDetailMotor
        ritelInformasiAgunanTambahanDetailMotor,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanTambahanDetailsMotor,
        arguments: InformasiAgunanTambahanDetailsMotorArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailMotor:
                ritelInformasiAgunanTambahanDetailMotor,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsCashCollateral({
    _i118.Key? key,
    required _i138.RitelInformasiAgunanTambahanDetailCashCollateral
        ritelInformasiAgunanTambahanDetailCashCollateral,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
        Routes.informasiAgunanTambahanDetailsCashCollateral,
        arguments: InformasiAgunanTambahanDetailsCashCollateralArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailCashCollateral:
                ritelInformasiAgunanTambahanDetailCashCollateral,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsMesin({
    _i118.Key? key,
    required _i139.RitelInformasiAgunanTambahanDetailMesin
        ritelInformasiAgunanTambahanDetailMesin,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanTambahanDetailsMesin,
        arguments: InformasiAgunanTambahanDetailsMesinArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailMesin:
                ritelInformasiAgunanTambahanDetailMesin,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanLKNView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanLKNView,
        arguments: InformasiAgunanLKNViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanLknDetails({
    _i118.Key? key,
    required _i140.RitelLaporanKunjunganNasabah ritelLaporanKunjunganNasabah,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanLknDetails,
        arguments: InformasiAgunanLknDetailsArguments(
            key: key,
            ritelLaporanKunjunganNasabah: ritelLaporanKunjunganNasabah,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanLknForm({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    _i140.RitelLaporanKunjunganNasabah? ritelLaporanKunjunganNasabah,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanLknForm,
        arguments: InformasiAgunanLknFormArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            ritelLaporanKunjunganNasabah: ritelLaporanKunjunganNasabah,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPinjamanViewRitel({
    _i118.Key? key,
    required _i141.RitelInformasiPinjaman ritelInformasiPinjaman,
    required String pipelinesId,
    required int loanTypesId,
    required String prakarsaId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPinjamanViewRitel,
        arguments: InformasiPinjamanViewRitelArguments(
            key: key,
            ritelInformasiPinjaman: ritelInformasiPinjaman,
            pipelinesId: pipelinesId,
            loanTypesId: loanTypesId,
            prakarsaId: prakarsaId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPinjamanDetailsRitel({
    _i118.Key? key,
    required _i141.RitelInformasiPinjaman ritelInformasiPinjaman,
    required String pipelinesId,
    required int loanTypesId,
    required String prakarsaId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPinjamanDetailsRitel,
        arguments: InformasiPinjamanDetailsRitelArguments(
            key: key,
            ritelInformasiPinjaman: ritelInformasiPinjaman,
            pipelinesId: pipelinesId,
            loanTypesId: loanTypesId,
            prakarsaId: prakarsaId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRiwayatProjekView({
    _i118.Key? key,
    required String prakarsaId,
    _i142.RitelRiwayatProjek? ritelRiwayatProjek,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.riwayatProjekView,
        arguments: RiwayatProjekViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            ritelRiwayatProjek: ritelRiwayatProjek,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTradeCheckingView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tradeCheckingView,
        arguments: TradeCheckingViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTradeCheckingDetails({
    _i118.Key? key,
    required _i143.RitelTradeChecking ritelTradeChecking,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tradeCheckingDetails,
        arguments: TradeCheckingDetailsArguments(
            key: key,
            ritelTradeChecking: ritelTradeChecking,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRiwayatProjekDetails({
    _i118.Key? key,
    required _i142.RitelRiwayatProjek ritelRiwayatProjek,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.riwayatProjekDetails,
        arguments: RiwayatProjekDetailsArguments(
            key: key,
            ritelRiwayatProjek: ritelRiwayatProjek,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUploadCRRView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    String? url,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.uploadCRRView,
        arguments: UploadCRRViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
            url: url),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUploadCRRDetails({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required String url,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.uploadCRRDetails,
        arguments: UploadCRRDetailsArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            url: url,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHasilAnalisaPinjamanViewRitel({
    _i118.Key? key,
    required String debiturName,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? status,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.hasilAnalisaPinjamanViewRitel,
        arguments: HasilAnalisaPinjamanViewRitelArguments(
            key: key,
            debiturName: debiturName,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable,
            status: status),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHasilAnalisaPinjamanSuccessView({
    _i118.Key? key,
    required String debiturName,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.hasilAnalisaPinjamanSuccessView,
        arguments: HasilAnalisaPinjamanSuccessViewArguments(
            key: key,
            debiturName: debiturName,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTDPPeroranganViewPari({
    _i118.Key? key,
    String? pipelineId,
    bool? fromPipelineDetailsView = false,
    bool? fromTDPViewRitel = false,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tDPPeroranganViewPari,
        arguments: TDPPeroranganViewPariArguments(
            key: key,
            pipelineId: pipelineId,
            fromPipelineDetailsView: fromPipelineDetailsView,
            fromTDPViewRitel: fromTDPViewRitel,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiDataDiriViewPari({
    _i118.Key? key,
    String? pipelineId,
    required bool fromTdpPeroranganView,
    _i121.RitelInformasiDataDiri? ritelInformasiDataDiri,
    bool? fromPipelineDetailsView,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiDataDiriViewPari,
        arguments: InformasiDataDiriViewPariArguments(
            key: key,
            pipelineId: pipelineId,
            fromTdpPeroranganView: fromTdpPeroranganView,
            ritelInformasiDataDiri: ritelInformasiDataDiri,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiUsahaDebiturPariView({
    _i118.Key? key,
    String? pipelineId,
    _i122.RitelInformasiUsaha? ritelInformasiUsaha,
    required bool fromTdpPeroranganView,
    bool? fromPipelineDetailsView = false,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiUsahaDebiturPariView,
        arguments: InformasiUsahaDebiturPariViewArguments(
            key: key,
            pipelineId: pipelineId,
            ritelInformasiUsaha: ritelInformasiUsaha,
            fromTdpPeroranganView: fromTdpPeroranganView,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiLainnyaPariView({
    _i118.Key? key,
    String? pipelineId,
    _i123.RitelInformasiLainnya? ritelInformasiLainnya,
    required bool fromTdpPeroranganView,
    bool? fromPipelineDetailsView,
    int? statusPipeline,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiLainnyaPariView,
        arguments: InformasiLainnyaPariViewArguments(
            key: key,
            pipelineId: pipelineId,
            ritelInformasiLainnya: ritelInformasiLainnya,
            fromTdpPeroranganView: fromTdpPeroranganView,
            fromPipelineDetailsView: fromPipelineDetailsView,
            statusPipeline: statusPipeline),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPipelineDetailsViewPari({
    required String id,
    required String debiturType,
    required int statusPipeline,
    _i118.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pipelineDetailsViewPari,
        arguments: PipelineDetailsViewPariArguments(
            id: id,
            debiturType: debiturType,
            statusPipeline: statusPipeline,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPipelineSuccessViewPari({
    _i118.Key? key,
    String? pipelineId,
    String? debiturName,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pipelineSuccessViewPari,
        arguments: PipelineSuccessViewPariArguments(
            key: key, pipelineId: pipelineId, debiturName: debiturName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanViewPari({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    required int status,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanViewPari,
        arguments: InformasiAgunanViewPariArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable,
            status: status),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanViewPari({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanTambahanViewPari,
        arguments: InformasiAgunanTambahanViewPariArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsTanahPari({
    _i118.Key? key,
    required _i135.RitelInformasiAgunanTambahanDetailTanah
        ritelInformasiAgunanTambahanDetailTanah,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanTambahanDetailsTanahPari,
        arguments: InformasiAgunanTambahanDetailsTanahPariArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailTanah:
                ritelInformasiAgunanTambahanDetailTanah,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsTanahBangunanPari({
    _i118.Key? key,
    required _i136.RitelInformasiAgunanTambahanDetailTanahBangunan
        ritelInformasiAgunanTambahanDetailTanahBangunan,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
        Routes.informasiAgunanTambahanDetailsTanahBangunanPari,
        arguments: InformasiAgunanTambahanDetailsTanahBangunanPariArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailTanahBangunan:
                ritelInformasiAgunanTambahanDetailTanahBangunan,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsMotorPari({
    _i118.Key? key,
    required _i137.RitelInformasiAgunanTambahanDetailMotor
        ritelInformasiAgunanTambahanDetailMotor,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanTambahanDetailsMotorPari,
        arguments: InformasiAgunanTambahanDetailsMotorPariArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailMotor:
                ritelInformasiAgunanTambahanDetailMotor,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsCashCollateralPari({
    _i118.Key? key,
    required _i138.RitelInformasiAgunanTambahanDetailCashCollateral
        ritelInformasiAgunanTambahanDetailCashCollateral,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(
        Routes.informasiAgunanTambahanDetailsCashCollateralPari,
        arguments: InformasiAgunanTambahanDetailsCashCollateralPariArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailCashCollateral:
                ritelInformasiAgunanTambahanDetailCashCollateral,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanTambahanDetailsMesinPari({
    _i118.Key? key,
    required _i139.RitelInformasiAgunanTambahanDetailMesin
        ritelInformasiAgunanTambahanDetailMesin,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanTambahanDetailsMesinPari,
        arguments: InformasiAgunanTambahanDetailsMesinPariArguments(
            key: key,
            ritelInformasiAgunanTambahanDetailMesin:
                ritelInformasiAgunanTambahanDetailMesin,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiAgunanLknDetailsPari({
    _i118.Key? key,
    required _i140.RitelLaporanKunjunganNasabah ritelLaporanKunjunganNasabah,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiAgunanLknDetailsPari,
        arguments: InformasiAgunanLknDetailsPariArguments(
            key: key,
            ritelLaporanKunjunganNasabah: ritelLaporanKunjunganNasabah,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiNonFinasialPageOneAPari({
    _i118.Key? key,
    required String prakarsaId,
    required String name,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiNonFinasialPageOneAPari,
        arguments: InformasiNonFinasialPageOneAPariArguments(
            key: key,
            prakarsaId: prakarsaId,
            name: name,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSummaryInformasiNonFinansialPari({
    _i118.Key? key,
    required String fullName,
    required _i134.RitelSummaryNonFinansial summaryNonFinansial,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.summaryInformasiNonFinansialPari,
        arguments: SummaryInformasiNonFinansialPariArguments(
            key: key,
            fullName: fullName,
            summaryNonFinansial: summaryNonFinansial,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPinjamanViewPari({
    _i118.Key? key,
    required _i141.RitelInformasiPinjaman ritelInformasiPinjaman,
    required String pipelinesId,
    required int loanTypesId,
    required String prakarsaId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPinjamanViewPari,
        arguments: InformasiPinjamanViewPariArguments(
            key: key,
            ritelInformasiPinjaman: ritelInformasiPinjaman,
            pipelinesId: pipelinesId,
            loanTypesId: loanTypesId,
            prakarsaId: prakarsaId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiPinjamanDetailsPari({
    _i118.Key? key,
    required _i141.RitelInformasiPinjaman ritelInformasiPinjaman,
    required String pipelinesId,
    required int loanTypesId,
    required String prakarsaId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiPinjamanDetailsPari,
        arguments: InformasiPinjamanDetailsPariArguments(
            key: key,
            ritelInformasiPinjaman: ritelInformasiPinjaman,
            pipelinesId: pipelinesId,
            loanTypesId: loanTypesId,
            prakarsaId: prakarsaId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiDebiturPari({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelinesId,
    bool backPipeline = false,
    required int status,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiDebiturPari,
        arguments: InformasiDebiturPariArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelinesId: pipelinesId,
            backPipeline: backPipeline,
            status: status),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiFinansialViewPari({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    required int status,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiFinansialViewPari,
        arguments: InformasiFinansialViewPariArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable,
            status: status),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLegalitasUsahaPariView({
    _i118.Key? key,
    required String prakarsaId,
    required _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.legalitasUsahaPariView,
        arguments: LegalitasUsahaPariViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTambahDokumenPariView({
    _i118.Key? key,
    required String prakarsaId,
    required _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tambahDokumenPariView,
        arguments: TambahDokumenPariViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpdateDokumenPariView({
    _i118.Key? key,
    required String prakarsaId,
    required int uploadDocFrom,
    _i131.RitelLegalitasUsahaUtama? ritelLegalitasUsahaUtama,
    _i132.RitelLegalitasUsahaLainnya? ritelLegalitasUsahaLainnya,
    required _i130.RitelPrakarsaPerorangan ritelPrakarsaPerorangan,
    required String pipelineId,
    required int loanTypesId,
    required int codeTable,
    required int status,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.updateDokumenPariView,
        arguments: UpdateDokumenPariViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            uploadDocFrom: uploadDocFrom,
            ritelLegalitasUsahaUtama: ritelLegalitasUsahaUtama,
            ritelLegalitasUsahaLainnya: ritelLegalitasUsahaLainnya,
            ritelPrakarsaPerorangan: ritelPrakarsaPerorangan,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            codeTable: codeTable,
            status: status),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInformasiFinansialFormPeriodPari({
    _i118.Key? key,
    String? prakarsaId,
    bool isFromForm = false,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.informasiFinansialFormPeriodPari,
        arguments: InformasiFinansialFormPeriodPariArguments(
            key: key,
            prakarsaId: prakarsaId,
            isFromForm: isFromForm,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMutasiTransaksiPariView({
    _i118.Key? key,
    required String prakarsaId,
    _i144.RitelMutasiTransaksiPariModel? ritelMutasiTransaksiPariModel,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    _i145.PlatformFile? fileMutasiTransaksiPari,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mutasiTransaksiPariView,
        arguments: MutasiTransaksiPariViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            ritelMutasiTransaksiPariModel: ritelMutasiTransaksiPariModel,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
            fileMutasiTransaksiPari: fileMutasiTransaksiPari),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMutasiTransaksiDetail({
    _i118.Key? key,
    required _i144.RitelMutasiTransaksiPariModel ritelMutasiTransaksiPariModel,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mutasiTransaksiDetail,
        arguments: MutasiTransaksiDetailArguments(
            key: key,
            ritelMutasiTransaksiPariModel: ritelMutasiTransaksiPariModel,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMutasiRekeningPariView({
    _i118.Key? key,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mutasiRekeningPariView,
        arguments: MutasiRekeningPariViewArguments(
            key: key,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMutasiRekeningPariFormView({
    _i118.Key? key,
    _i133.RitelMutasiRekening? ritelMutasiRekening,
    required String prakarsaId,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mutasiRekeningPariFormView,
        arguments: MutasiRekeningPariFormViewArguments(
            key: key,
            ritelMutasiRekening: ritelMutasiRekening,
            prakarsaId: prakarsaId,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
            index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMutasiRekeningDetailsPari({
    _i118.Key? key,
    required _i133.RitelMutasiRekening ritelMutasiRekening,
    _i146.RitelMutasiRekeningHeader? ritelMutasiRekeningHeader,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    int? index,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mutasiRekeningDetailsPari,
        arguments: MutasiRekeningDetailsPariArguments(
            key: key,
            ritelMutasiRekening: ritelMutasiRekening,
            ritelMutasiRekeningHeader: ritelMutasiRekeningHeader,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
            index: index),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMutasiRekeningDetailsItemPari({
    _i118.Key? key,
    required _i133.DetailMutasi detailMutasi,
    required String pipelineId,
    required int loanTypesId,
    required int status,
    required int codeTable,
    required String prakarsaId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mutasiRekeningDetailsItemPari,
        arguments: MutasiRekeningDetailsItemPariArguments(
            key: key,
            detailMutasi: detailMutasi,
            pipelineId: pipelineId,
            loanTypesId: loanTypesId,
            status: status,
            codeTable: codeTable,
            prakarsaId: prakarsaId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMonitoringRitelView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.monitoringRitelView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMonitoringDetailView({
    required String idKelolaan,
    required int loanType,
    _i118.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.monitoringDetailView,
        arguments: MonitoringDetailViewArguments(
            idKelolaan: idKelolaan, loanType: loanType, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTambahPencairanView({
    _i118.Key? key,
    required int step,
    String? idKelolaan,
    String? idPartner,
    _i120.MonitoringPinjamanDetail? pinjamanDetail,
    int? counter,
    String? status,
    int? loanType,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tambahPencairanView,
        arguments: TambahPencairanViewArguments(
            key: key,
            step: step,
            idKelolaan: idKelolaan,
            idPartner: idPartner,
            pinjamanDetail: pinjamanDetail,
            counter: counter,
            status: status,
            loanType: loanType),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPinjamanDetailView({
    _i118.Key? key,
    required int counter,
    required int disburseId,
    required String status,
    required int loanType,
    required String idKelolaan,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pinjamanDetailView,
        arguments: PinjamanDetailViewArguments(
            key: key,
            counter: counter,
            disburseId: disburseId,
            status: status,
            loanType: loanType,
            idKelolaan: idKelolaan),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPenurunanPinjamanView({
    _i118.Key? key,
    required Map<String, dynamic> disburseData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.penurunanPinjamanView,
        arguments: PenurunanPinjamanViewArguments(
            key: key, disburseData: disburseData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPenurunanPinjamanSuccessView({
    _i118.Key? key,
    required Map<String, dynamic> disburseData,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.penurunanPinjamanSuccessView,
        arguments: PenurunanPinjamanSuccessViewArguments(
            key: key, disburseData: disburseData),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
