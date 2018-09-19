class perListModel {
  String errCode;
  String errMsg;
  List<PerModel> data;
  String errData;

  perListModel({this.errCode, this.errMsg, this.data, this.errData});

  perListModel.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    if (json['data'] != null) {
      data = new List<PerModel>();
      json['data'].forEach((v) {
        data.add(new PerModel.fromJson(v));
      });
    }
    errData = json['errData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errCode'] = this.errCode;
    data['errMsg'] = this.errMsg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['errData'] = this.errData;
    return data;
  }
}

class PerModel {
  int id;
  String title;
  String year;
  String month;
  String monthRate;
  String periods;
  String thumb;
  double price;
  double oldPrice;
  String isFree;
  int sort;
  String homeRecommend;
  String status;
  String createdTime;
  int createdBy;
  String updatedTime;
  int updatedBy;

  PerModel(
      {this.id,
        this.title,
        this.year,
        this.month,
        this.monthRate,
        this.periods,
        this.thumb,
        this.price,
        this.oldPrice,
        this.isFree,
        this.sort,
        this.homeRecommend,
        this.status,
        this.createdTime,
        this.createdBy,
        this.updatedTime,
        this.updatedBy});

  PerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    month = json['month'];
    monthRate = json['monthRate'];
    periods = json['periods'];
    thumb = json['thumb'];
    price = json['price'];
    oldPrice = json['oldPrice']??20.0;
    isFree = json['isFree'];
    sort = json['sort'];
    homeRecommend = json['homeRecommend'];
    status = json['status'];
    createdTime = json['createdTime'];
    createdBy = json['createdBy'];
    updatedTime = json['updatedTime'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['year'] = this.year;
    data['month'] = this.month;
    data['monthRate'] = this.monthRate;
    data['periods'] = this.periods;
    data['thumb'] = this.thumb;
    data['price'] = this.price;
    data['oldPrice'] = this.oldPrice;
    data['isFree'] = this.isFree;
    data['sort'] = this.sort;
    data['homeRecommend'] = this.homeRecommend;
    data['status'] = this.status;
    data['createdTime'] = this.createdTime;
    data['createdBy'] = this.createdBy;
    data['updatedTime'] = this.updatedTime;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}