// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:dio/src/dio.dart';
import 'package:places_service/src/places_service.dart';
import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';

import '../../infrastructure/apis/employees_api.dart';
import '../../infrastructure/apis/ritel_generate_token_api.dart';
import '../../infrastructure/apis/ritel_informasi_agunan_pokok_api.dart';
import '../../infrastructure/apis/ritel_informasi_agunan_tambahan_api.dart';
import '../../infrastructure/apis/ritel_informasi_pinjaman_api.dart';
import '../../infrastructure/apis/ritel_laporan_kunjungan_nasabah_api.dart';
import '../../infrastructure/apis/ritel_legalitas_usaha_api.dart';
import '../../infrastructure/apis/ritel_master_api.dart';
import '../../infrastructure/apis/ritel_monitoring_api.dart';
import '../../infrastructure/apis/ritel_mutasi_rekening_api.dart';
import '../../infrastructure/apis/ritel_partnership_api.dart';
import '../../infrastructure/apis/ritel_pencairan_api.dart';
import '../../infrastructure/apis/ritel_penurunan_api.dart';
import '../../infrastructure/apis/ritel_pipeline_perorangan_api.dart';
import '../../infrastructure/apis/ritel_pipeline_perusahaan_cv_api.dart';
import '../../infrastructure/apis/ritel_pipeline_perusahaan_pt_api.dart';
import '../../infrastructure/apis/ritel_prakarsa_api.dart';
import '../../infrastructure/apis/ritel_riwayat_projek_api.dart';
import '../../infrastructure/apis/ritel_screening_api.dart';
import '../../infrastructure/apis/ritel_trade_checking_api.dart';
import '../../infrastructure/apis/ritel_upload_crr_api.dart';
import '../../infrastructure/apis/ritel_upload_file_api.dart';
import '../../infrastructure/apis/user_api.dart';
import '../services/connectivity_service.dart';
import '../services/dio_service.dart';
import '../services/local_db_service.dart';
import '../services/location_service.dart';
import '../services/media_service.dart';
import '../services/url_launcher_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => PlacesService());
  locator.registerLazySingleton(() => MaksimaLocationService());
  locator.registerLazySingleton(() => MaksimaMediaService());
  locator.registerLazySingleton(() => URLLauncherService());
  locator.registerLazySingleton(() => ConnectivityService());
  locator.registerSingleton(MaksimaLocalDBService());
  locator.registerSingleton<Dio>(DioService.getInstance());
  locator.registerLazySingleton(() => UserAPI());
  locator.registerLazySingleton(() => EmployeesAPI());
  locator.registerLazySingleton(() => RitelGenerateTokenAPI());
  locator.registerLazySingleton(() => RitelMasterAPI());
  locator.registerLazySingleton(() => RitelUploadFileAPI());
  locator.registerLazySingleton(() => RitelPipelinePeroranganAPI());
  locator.registerLazySingleton(() => RitelPipelinePerusahaanCvAPI());
  locator.registerLazySingleton(() => RitelPipelinePerusahaanPtAPI());
  locator.registerLazySingleton(() => RitelScreeningAPI());
  locator.registerLazySingleton(() => RitelPrakarsaAPI());
  locator.registerLazySingleton(() => RitelLegalitasUsahaAPI());
  locator.registerLazySingleton(() => RitelInformasiAgunanTambahanAPI());
  locator.registerLazySingleton(() => RitelInformasiAgunanPokokAPI());
  locator.registerLazySingleton(() => RitelLaporanKunjunganNasabahAPI());
  locator.registerLazySingleton(() => RitelInformasiPinjamanAPI());
  locator.registerLazySingleton(() => RitelRiwayatProyekAPI());
  locator.registerLazySingleton(() => RitelTradeCheckingAPI());
  locator.registerLazySingleton(() => RitelMutasiRekeningAPI());
  locator.registerLazySingleton(() => RitelUploadCRRAPI());
  locator.registerLazySingleton(() => RitelMonitoringAPI());
  locator.registerLazySingleton(() => RitelPartnershipAPI());
  locator.registerLazySingleton(() => RitelPencairanAPI());
  locator.registerLazySingleton(() => RitelPenurunanAPI());
}
