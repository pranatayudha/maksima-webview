// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, newline-before-return

class RitelPrakarsaStatusPengajuanObject {
  int? status;
  String? reason;
  String? arguments;

  RitelPrakarsaStatusPengajuanObject({
    this.status,
    this.reason,
    this.arguments,
  });

  RitelPrakarsaStatusPengajuanObject.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    arguments = json['arguments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['arguments'] = this.arguments;
    return data;
  }
}
