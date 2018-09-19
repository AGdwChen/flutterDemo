class ReqBookListModel {
  String errCode;
  String errMsg;
  ResListData data;
  String errData;

  ReqBookListModel({this.errCode, this.errMsg, this.data, this.errData});

  ReqBookListModel.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    data = json['data'] != null ? new ResListData.fromJson(json['data']) : null;
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

class ResListData {
  List<BookModel> books;
  String osspath;

  ResListData({this.books, this.osspath});

  ResListData.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = new List<BookModel>();
      json['books'].forEach((v) {
        books.add(new BookModel.fromJson(v));
      });
    }
    osspath = json['osspath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['books'] = this.books.map((v) => v.toJson()).toList();
    }
    data['osspath'] = this.osspath;
    return data;
  }
}

class BookModel {
  String createdTime;
  String homeRecommend;
  String thumb;
  String intro;
  String name;
  int id;
  int sort;
  String press;
  String status;

  BookModel(
      {this.createdTime,
        this.homeRecommend,
        this.thumb,
        this.intro,
        this.name,
        this.id,
        this.sort,
        this.press,
        this.status});

  BookModel.fromJson(Map<String, dynamic> json) {
    createdTime = json['created_time'];
    homeRecommend = json['home_recommend'];
    thumb = json['thumb'];
    intro = json['intro'];
    name = json['name'];
    id = json['id'];
    sort = json['sort'];
    press = json['press'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_time'] = this.createdTime;
    data['home_recommend'] = this.homeRecommend;
    data['thumb'] = this.thumb;
    data['intro'] = this.intro;
    data['name'] = this.name;
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['press'] = this.press;
    data['status'] = this.status;
    return data;
  }
}