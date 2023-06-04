class Endpoint {
  static const userLoginSSO = '/user/login-sso';
  static const userLogoutSSO = '/user/logout-sso';

  static const prakarsaAdd = '/prakarsa/add';
  static const prakarsaAddUsaha = '/prakarsa/add-usaha';
  static const prakarsaFind = '/prakarsa/find';
  static const prakarsaUpdate = '/prakarsa/update';
  static const prakarsaFindUsaha = '/prakarsa/find-usaha';
  static const prakarsaUpdateUsaha = '/prakarsa/update-usaha';
  static const prakarsaList = '/prakarsa/list';
  static const prakarsaDetail = '/prakarsa/detail';
  static const prakarsaFindAddressHome = '/prakarsa/find-address-home';
  static const prakarsaFindFlag = '/prakarsa/find-flag';
  static const prakarsaApprovedCustomer = '/prakarsa/approved-customer';
  static const prakarsaRejectedCustomer = '/prakarsa/rejected-customer';
  static const prakarsaDelete = '/prakarsa/delete';

  static const prakarsaAgunanPokokDetail = '/prakarsa/agunan-pokok/detail';
  static const prakarsaAgunanPokokList = '/prakarsa/agunan-pokok/list';
  static const prakarsaAgunanPokokSave = '/prakarsa/agunan-pokok/save';

  static const prakarsaAgunanTambahanAddTanahBangunan =
      '/prakarsa/agunan-tambahan/tanah-bangunan/add';
  static const prakarsaAgunanTambahanAddTanah =
      '/prakarsa/agunan-tambahan/tanah/add';
  static const prakarsaAgunanTambahanAddCashCollateral =
      '/prakarsa/agunan-tambahan/cash-collateral/add';
  static const prakarsaAgunanTambahanAddMotor =
      '/prakarsa/agunan-tambahan/kendaraan-bermotor/add';
  static const prakarsaAgunanTambahanAddMesin =
      '/prakarsa/agunan-tambahan/mesin/add';
  static const prakarsaAgunanTambahanDetail =
      '/prakarsa/agunan-tambahan/detail';
  static const prakarsaAgunanTambahanList = '/prakarsa/agunan-tambahan/list';

  static const prakarsaLKNAdd = '/prakarsa/lkn/add';
  static const prakarsaLKNList = '/prakarsa/lkn/list';
  static const prakarsaLKNUpdate = '/prakarsa/lkn/update';

  static const masterProvinces = '/master/provinces';
  static const masterCities = '/master/cities';
  static const masterDistricts = '/master/districts';
  static const masterVillages = '/master/villages';
  static const masterPostalCodes = '/master/postal-codes';
  static const masterEconomicSector = '/master/economic-sector';
  static const masterEconomicSubSector = '/master/economic-sub-sector';
  static const masterBusinessType = '/master/business-type';

  static const partnershipsList = '/partnerships/list';

  static const scoringProcess = '/scoring/process';

  static const crsAddUsaha = '/crs/add-usaha';
  static const crsFindUsaha = '/crs/find-usaha';
  static const crsFindFlag = '/crs/find-flag';
  static const crsAddFinansial = '/crs/add-finansial';
  static const crsFindFinansial = '/crs/find-finansial';
  static const crsUpdateFinansial = '/crs/update-finansial';
  static const crsListAgunan = '/crs/list-agunan';
  static const crsAddAgunan = '/crs/add-agunan';
  static const crsFindAgunan = '/crs/find-agunan';
  static const crsUpdateAgunan = '/crs/update-agunan';
  static const crsDeleteAgunan = '/crs/delete-agunan';
  static const crsFindPinjaman = '/crs/find-pinjaman';
  static const crsUpdatePinjaman = '/crs/update-pinjaman';

  static const screeningProcess = '/screening/process';
  static const screeningFindSLIK = '/screening/find-slik';
  static const screeningFindSLIKPartner = '/screening/find-slik-partner';
  static const screeningFindDukcapil = '/screening/find-dukcapil';
  static const screeningFindDukcapilPartner =
      '/screening/find-dukcapil-partner';
  static const screeningFindDHN = '/screening/find-dhn';
  static const screeningFindSIKP = '/screening/find-sikp';
  static const screeningFindSICD = '/screening/find-sicd';
  static const screeningSLIKPDF = '/screening/slik-pdf';

  static const notificationsList = '/notifications/list';
  static const notificationsCount = '/notifications/count';
  static const notificationsRead = '/notifications/read';

  static const employeesRegister = '/employees/register';

  static const potentialCustomersList = '/potential-customers/list';
  static const potentialCustomersFind = '/potential-customers/find';
  static const potentialCustomersApproved = '/potential-customers/approved';
  static const potentialCustomersRejected = '/potential-customers/rejected';
}
