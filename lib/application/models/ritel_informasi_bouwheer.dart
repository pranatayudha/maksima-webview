// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class RitelInformasiBouwheer {
  bool? success;
  List<Data>? data;
  String? message;
  int? code;

  RitelInformasiBouwheer({this.success, this.data, this.message, this.code});

  RitelInformasiBouwheer.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    // ignore: newline-before-return
    return data;
  }
}

class Data {
  String? id;
  String? partnerName;
  String? picName;
  String? picPhone;
  String? picEmail;
  String? picJabatan;

  Data({
    this.id,
    this.partnerName,
    this.picName,
    this.picPhone,
    this.picEmail,
    this.picJabatan,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    partnerName = json['partnerName'];
    picName = json['picName'];
    picPhone = json['picPhone'];
    picEmail = json['picEmail'];
    picJabatan = json['picJabatan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['partnerName'] = this.partnerName;
    data['picName'] = this.picName;
    data['picPhone'] = this.picPhone;
    data['picEmail'] = this.picEmail;
    data['picJabatan'] = this.picJabatan;
    // ignore: newline-before-return
    return data;
  }
}
