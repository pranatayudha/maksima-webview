class DetailCRRPrakarsa {
  bool? success;
  Data? data;
  String? message;
  int? code;

  DetailCRRPrakarsa({this.success, this.data, this.message, this.code});

  DetailCRRPrakarsa.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? prakarsaId;
  String? name;
  int? creditRating;
  int? creditRiskRating;
  String? creditRiskLabel;
  String? creditRiskInfo;
  CreditRisk? creditRisk;

  Data(
      {this.prakarsaId,
      this.name,
      this.creditRating,
      this.creditRiskRating,
      this.creditRiskLabel,
      this.creditRiskInfo,
      this.creditRisk});

  Data.fromJson(Map<String, dynamic> json) {
    prakarsaId = json['prakarsaId'];
    name = json['name'];
    creditRating = json['creditRating'];
    creditRiskRating = json['creditRiskRating'];
    creditRiskLabel = json['creditRiskLabel'];
    creditRiskInfo = json['creditRiskInfo'];
    creditRisk = json['creditRisk'] != null
        ? new CreditRisk.fromJson(json['creditRisk'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prakarsaId'] = this.prakarsaId;
    data['name'] = this.name;
    data['creditRating'] = this.creditRating;
    data['creditRiskRating'] = this.creditRiskRating;
    data['creditRiskLabel'] = this.creditRiskLabel;
    data['creditRiskInfo'] = this.creditRiskInfo;
    if (this.creditRisk != null) {
      data['creditRisk'] = this.creditRisk!.toJson();
    }
    return data;
  }
}

class CreditRisk {
  int? financial;
  int? nonFinancial;

  CreditRisk({this.financial, this.nonFinancial});

  CreditRisk.fromJson(Map<String, dynamic> json) {
    financial = json['financial'];
    nonFinancial = json['nonFinancial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['financial'] = this.financial;
    data['nonFinancial'] = this.nonFinancial;
    return data;
  }
}
