// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, newline-before-return

class RitelTradeChecking {
  String? id;
  String? prakarsaId;
  String? summary;
  String? pathUploadExcel;
  String? fileName;
  List<DetailSupplier>? detailSupplier;
  List<DetailSupplier>? detailBuyer;

  RitelTradeChecking({
    this.id,
    this.prakarsaId,
    this.summary,
    this.pathUploadExcel,
    this.fileName,
    this.detailSupplier,
    this.detailBuyer,
  });

  RitelTradeChecking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prakarsaId = json['prakarsaId'];
    summary = json['summary'];
    pathUploadExcel = json['pathUploadExcel'];
    fileName = json['fileName'];
    if (json['detailSupplier'] != null) {
      detailSupplier = <DetailSupplier>[];
      json['detailSupplier'].forEach((v) {
        detailSupplier!.add(new DetailSupplier.fromJson(v));
      });
    }
    if (json['detailBuyer'] != null) {
      detailBuyer = <DetailSupplier>[];
      json['detailBuyer'].forEach((v) {
        detailBuyer!.add(new DetailSupplier.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['prakarsaId'] = this.prakarsaId;
    data['summary'] = this.summary;
    data['pathUploadExcel'] = this.pathUploadExcel;
    data['fileName'] = this.fileName;
    if (this.detailSupplier != null) {
      data['detailSupplier'] =
          this.detailSupplier!.map((v) => v.toJson()).toList();
    }
    if (this.detailBuyer != null) {
      data['detailBuyer'] = this.detailBuyer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DetailSupplier {
  String? id;
  String? tradeCheckingId;
  String? type;
  String? name;
  String? addresses;
  String? phoneNum;
  String? lamaBekerja;

  DetailSupplier({
    this.id,
    this.tradeCheckingId,
    this.type,
    this.name,
    this.addresses,
    this.phoneNum,
    this.lamaBekerja,
  });

  DetailSupplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeCheckingId = json['trade_checkingId'];
    type = json['type'];
    name = json['name'];
    addresses = json['addresses'];
    phoneNum = json['phoneNum'];
    lamaBekerja = json['lamaBekerja'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trade_checkingId'] = this.tradeCheckingId;
    data['type'] = this.type;
    data['name'] = this.name;
    data['addresses'] = this.addresses;
    data['phoneNum'] = this.phoneNum;
    data['lamaBekerja'] = this.lamaBekerja;
    return data;
  }
}
