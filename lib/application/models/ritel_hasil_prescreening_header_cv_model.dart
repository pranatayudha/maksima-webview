// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class RitelHasilPreScreeningHeaderCV {
  String? pipelineFlagId;
  String? pipelinesId;
  int? codeTable;
  String? titlePipeline;
  String? npwpNumb;
  String? resultScreening;

  RitelHasilPreScreeningHeaderCV(
      {this.pipelineFlagId,
      this.pipelinesId,
      this.codeTable,
      this.titlePipeline,
      this.npwpNumb,
      this.resultScreening,});

  RitelHasilPreScreeningHeaderCV.fromJson(Map<String, dynamic> json) {
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