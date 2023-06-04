// ignore_for_file: prefer_void_to_null, unnecessary_this, prefer_collection_literals, unnecessary_new

class RitelPencairanModels {
  String? idKelolaan;
  String? partnerId;
  String? dateConfirm;
  String? jenisDocUnderlying;
  String? nameDocUnderlying;
  String? numDocUnderlying;
  String? dateDocUnderlying;
  String? nominalUnderlying;
  String? dateJatuhTempoUnderlying;
  String? jenisConfirm;
  String? hasilConfirmBouwheer;
  String? pathBuktiConfirm;
  String? limitTersedia;
  String? ppn;
  String? cadanganBunga;
  String? cadanganBungaTempo;
  String? sharingDana;
  String? disburseAmount;
  String? cadanganBungaEndDate;
  String? numOfDayLoan;
  String? otherPayment;
  Null paymentAccountBank;
  Null paymentAccountNum;
  Null paymentAccountName;
  String? pathUnderlyingDoc;
  String? pathSuratPermohonanPencairan;
  Null pathStandingInstruction;

  RitelPencairanModels({
    this.idKelolaan,
    this.partnerId,
    this.dateConfirm,
    this.jenisDocUnderlying,
    this.nameDocUnderlying,
    this.numDocUnderlying,
    this.dateDocUnderlying,
    this.nominalUnderlying,
    this.dateJatuhTempoUnderlying,
    this.jenisConfirm,
    this.hasilConfirmBouwheer,
    this.pathBuktiConfirm,
    this.limitTersedia,
    this.ppn,
    this.cadanganBunga,
    this.cadanganBungaTempo,
    this.sharingDana,
    this.disburseAmount,
    this.cadanganBungaEndDate,
    this.numOfDayLoan,
    this.otherPayment,
    this.paymentAccountBank,
    this.paymentAccountNum,
    this.paymentAccountName,
    this.pathUnderlyingDoc,
    this.pathSuratPermohonanPencairan,
    this.pathStandingInstruction,
  });

  RitelPencairanModels.fromJson(Map<String, dynamic> json) {
    idKelolaan = json['idKelolaan'];
    partnerId = json['partnerId'];
    dateConfirm = json['dateConfirm'];
    jenisDocUnderlying = json['jenisDocUnderlying'];
    nameDocUnderlying = json['nameDocUnderlying'];
    numDocUnderlying = json['numDocUnderlying'];
    dateDocUnderlying = json['dateDocUnderlying'];
    nominalUnderlying = json['nominalUnderlying'];
    dateJatuhTempoUnderlying = json['dateJatuhTempoUnderlying'];
    jenisConfirm = json['jenisConfirm'];
    hasilConfirmBouwheer = json['hasilConfirmBouwheer'];
    pathBuktiConfirm = json['pathBuktiConfirm'];
    limitTersedia = json['limitTersedia'];
    ppn = json['ppn'];
    cadanganBunga = json['cadanganBunga'];
    cadanganBungaTempo = json['cadanganBungaTempo'];
    sharingDana = json['sharingDana'];
    disburseAmount = json['disburseAmount'];
    cadanganBungaEndDate = json['cadanganBungaEndDate'];
    numOfDayLoan = json['numOfDayLoan'];
    otherPayment = json['otherPayment'];
    paymentAccountBank = json['paymentAccountBank'];
    paymentAccountNum = json['paymentAccountNum'];
    paymentAccountName = json['paymentAccountName'];
    pathUnderlyingDoc = json['pathUnderlyingDoc'];
    pathSuratPermohonanPencairan = json['pathSuratPermohonanPencairan'];
    pathStandingInstruction = json['pathStandingInstruction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idKelolaan'] = this.idKelolaan;
    data['partnerId'] = this.partnerId;
    data['dateConfirm'] = this.dateConfirm;
    data['jenisDocUnderlying'] = this.jenisDocUnderlying;
    data['nameDocUnderlying'] = this.nameDocUnderlying;
    data['numDocUnderlying'] = this.numDocUnderlying;
    data['dateDocUnderlying'] = this.dateDocUnderlying;
    data['nominalUnderlying'] = this.nominalUnderlying;
    data['dateJatuhTempoUnderlying'] = this.dateJatuhTempoUnderlying;
    data['jenisConfirm'] = this.jenisConfirm;
    data['hasilConfirmBouwheer'] = this.hasilConfirmBouwheer;
    data['pathBuktiConfirm'] = this.pathBuktiConfirm;
    data['limitTersedia'] = this.limitTersedia;
    data['ppn'] = this.ppn;
    data['cadanganBunga'] = this.cadanganBunga;
    data['cadanganBungaTempo'] = this.cadanganBungaTempo;
    data['sharingDana'] = this.sharingDana;
    data['disburseAmount'] = this.disburseAmount;
    data['cadanganBungaEndDate'] = this.cadanganBungaEndDate;
    data['numOfDayLoan'] = this.numOfDayLoan;
    data['otherPayment'] = this.otherPayment;
    data['paymentAccountBank'] = this.paymentAccountBank;
    data['paymentAccountNum'] = this.paymentAccountNum;
    data['paymentAccountName'] = this.paymentAccountName;
    data['pathUnderlyingDoc'] = this.pathUnderlyingDoc;
    data['pathSuratPermohonanPencairan'] = this.pathSuratPermohonanPencairan;
    data['pathStandingInstruction'] = this.pathStandingInstruction;
    // ignore: newline-before-return
    return data;
  }
}
