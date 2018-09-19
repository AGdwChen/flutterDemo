class ReqAudioListModel {
  String errCode;
  String errMsg;
  ResListInfoData data;
  String errData;

  ReqAudioListModel({this.errCode, this.errMsg, this.data, this.errData});

  ReqAudioListModel.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    data = json['data'] != null ? new ResListInfoData.fromJson(json['data']) : null;
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

class ResListInfoData {
  List<AudioModel> resultData;
  String osspath;

  ResListInfoData({this.resultData, this.osspath});

  ResListInfoData.fromJson(Map<String, dynamic> json) {
    if (json['resultData'] != null) {
      resultData = new List<AudioModel>();
      json['resultData'].forEach((v) {
        resultData.add(new AudioModel.fromJson(v));
      });
    }
    osspath = json['osspath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resultData != null) {
      data['resultData'] = this.resultData.map((v) => v.toJson()).toList();
    }
    data['osspath'] = this.osspath;
    return data;
  }
}

class AudioModel {
  int id;
  String title;
  String intro;
  String thumb;
  String thumbBig;
  String isFree;
  double price;
  String homeRecommend;
  String status;
  int sort;
  int createdBy;
  String createdTime;
  int updatedBy;
  String updatedTime;

  AudioModel(
      {this.id,
        this.title,
        this.intro,
        this.thumb,
        this.thumbBig,
        this.isFree,
        this.price,
        this.homeRecommend,
        this.status,
        this.sort,
        this.createdBy,
        this.createdTime,
        this.updatedBy,
        this.updatedTime});

  AudioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    intro = json['intro'];
    thumb = json['thumb'];
    thumbBig = json['thumbBig'];
    isFree = json['isFree'];
    price = json['price'];
    homeRecommend = json['homeRecommend'];
    status = json['status'];
    sort = json['sort'];
    createdBy = json['createdBy'];
    createdTime = json['createdTime'];
    updatedBy = json['updatedBy'];
    updatedTime = json['updatedTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['intro'] = this.intro;
    data['thumb'] = this.thumb;
    data['thumbBig'] = this.thumbBig;
    data['isFree'] = this.isFree;
    data['price'] = this.price;
    data['homeRecommend'] = this.homeRecommend;
    data['status'] = this.status;
    data['sort'] = this.sort;
    data['createdBy'] = this.createdBy;
    data['createdTime'] = this.createdTime;
    data['updatedBy'] = this.updatedBy;
    data['updatedTime'] = this.updatedTime;
    return data;
  }
}

