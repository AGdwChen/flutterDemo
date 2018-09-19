class perYearsModel {
  String errCode;
  String errMsg;
  YearData data;
  String errData;

  perYearsModel({this.errCode, this.errMsg, this.data, this.errData});

  perYearsModel.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    data = json['data'] != null ? new YearData.fromJson(json['data']) : null;
    errData = json['errData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errCode'] = this.errCode;
    data['errMsg'] = this.errMsg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['errData'] = this.errData;
    return data;
  }
}

class YearData {
  List<String> resultData;
  String osspath;

  YearData({this.resultData, this.osspath});

  YearData.fromJson(Map<String, dynamic> json) {
    resultData = json['resultData'].cast<String>();
    osspath = json['osspath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultData'] = this.resultData;
    data['osspath'] = this.osspath;
    return data;
  }
}