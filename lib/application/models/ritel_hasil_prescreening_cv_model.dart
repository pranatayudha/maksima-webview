// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class RitelHasilPreScreeningCV {
  Header? header;
  List<SummaryScreening>? summaryScreening;

  RitelHasilPreScreeningCV({this.header, this.summaryScreening});

  RitelHasilPreScreeningCV.fromJson(Map<String, dynamic> json) {
    header =
        json['header'] != null ? new Header.fromJson(json['header']) : null;
    if (json['summaryScreening'] != null) {
      summaryScreening = <SummaryScreening>[];
      json['summaryScreening'].forEach((v) {
        summaryScreening!.add(new SummaryScreening.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.header != null) {
      data['header'] = this.header!.toJson();
    }
    if (this.summaryScreening != null) {
      data['summaryScreening'] =
          this.summaryScreening!.map((v) => v.toJson()).toList();
    }
    // ignore: newline-before-return
    return data;
  }
}

class Header {
  String? pipelineFlagId;
  String? pipelinesId;
  int? codeTable;
  String? titlePipeline;
  String? npwpNumb;
  String? resultScreening;

  Header({
    this.pipelineFlagId,
    this.pipelinesId,
    this.codeTable,
    this.titlePipeline,
    this.npwpNumb,
    this.resultScreening,
  });

  Header.fromJson(Map<String, dynamic> json) {
    pipelineFlagId = json['pipeline_flagId'];
    pipelinesId = json['pipelinesId'];
    codeTable = json['codeTable'];
    titlePipeline = json['titlePipeline'];
    npwpNumb = json['npwpNumb'];
    resultScreening = json['resultScreening'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pipeline_flagId'] = this.pipelineFlagId;
    data['pipelinesId'] = this.pipelinesId;
    data['codeTable'] = this.codeTable;
    data['titlePipeline'] = this.titlePipeline;
    data['npwpNumb'] = this.npwpNumb;
    data['resultScreening'] = this.resultScreening;
    // ignore: newline-before-return
    return data;
  }
}

class SummaryScreening {
  int? mgmt;
  Data? data;
  SpouseData? spouseData;

  SummaryScreening({this.mgmt, this.data, this.spouseData});

  SummaryScreening.fromJson(Map<String, dynamic> json) {
    mgmt = json['mgmt'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    spouseData = json['spouseData'] != null
        ? new SpouseData.fromJson(json['spouseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mgmt'] = this.mgmt;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.spouseData != null) {
      data['spouseData'] = this.spouseData!.toJson();
    }
    // ignore: newline-before-return
    return data;
  }
}

class Data {
  String? name;
  Dhn? dhn;
  Dhn? lpg;
  Slik? slik;
  Dukcapil? dukcapil;

  Data({this.name, this.dhn, this.lpg, this.slik, this.dukcapil});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dhn = json['dhn'] != null ? new Dhn.fromJson(json['dhn']) : null;
    lpg = json['lpg'] != null ? new Dhn.fromJson(json['lpg']) : null;
    slik = json['slik'] != null ? new Slik.fromJson(json['slik']) : null;
    dukcapil = json['dukcapil'] != null
        ? new Dukcapil.fromJson(json['dukcapil'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.dhn != null) {
      data['dhn'] = this.dhn!.toJson();
    }
    if (this.lpg != null) {
      data['lpg'] = this.lpg!.toJson();
    }
    if (this.slik != null) {
      data['slik'] = this.slik!.toJson();
    }
    if (this.dukcapil != null) {
      data['dukcapil'] = this.dukcapil!.toJson();
    }
    // ignore: newline-before-return
    return data;
  }
}

class Dhn {
  String? status;
  String? reason;

  Dhn({this.status, this.reason});

  Dhn.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    // ignore: newline-before-return
    return data;
  }
}

class Slik {
  String? status;
  String? reason;
  String? path;

  Slik({this.status, this.reason, this.path});

  Slik.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['path'] = this.path;
    // ignore: newline-before-return
    return data;
  }
}

class Dukcapil {
  String? status;
  List<Reason>? reason;

  Dukcapil({this.status, this.reason});

  Dukcapil.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['reason'] != null) {
      reason = <Reason>[];
      json['reason'].forEach((v) {
        reason!.add(new Reason.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.reason != null) {
      data['reason'] = this.reason!.map((v) => v.toJson()).toList();
    }
    // ignore: newline-before-return
    return data;
  }
}

class Reason {
  String? field;
  String? fieldName;
  String? result;
  String? path;

  Reason({this.field, this.fieldName, this.result, this.path});

  Reason.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    fieldName = json['fieldName'];
    result = json['result'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field'] = this.field;
    data['fieldName'] = this.fieldName;
    data['result'] = this.result;
    data['path'] = this.path;
    // ignore: newline-before-return
    return data;
  }
}

class SpouseData {
  String? name;
  Dhn? dhn;
  Dukcapil? dukcapil;
  Slik? slik;

  SpouseData({this.name, this.dhn, this.dukcapil, this.slik});

  SpouseData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dhn = json['dhn'] != null ? new Dhn.fromJson(json['dhn']) : null;
    dukcapil = json['dukcapil'] != null
        ? new Dukcapil.fromJson(json['dukcapil'])
        : null;
    slik = json['slik'] != null ? new Slik.fromJson(json['slik']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.dhn != null) {
      data['dhn'] = this.dhn!.toJson();
    }
    if (this.dukcapil != null) {
      data['dukcapil'] = this.dukcapil!.toJson();
    }
    if (this.slik != null) {
      data['slik'] = this.slik!.toJson();
    }
    // ignore: newline-before-return
    return data;
  }
}
