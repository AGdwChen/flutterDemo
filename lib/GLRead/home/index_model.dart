class indexModel {
  String errCode;
  String errMsg;
  Data data;
  String errData;

  indexModel({this.errCode, this.errMsg, this.data, this.errData});

  indexModel.fromJson(Map<String, dynamic> json) {
    errCode = json['errCode'];
    errMsg = json['errMsg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  List<Ads> ads;
  Books books;
  Periodicals periodicals;
  Course course;
  String osspath;

  Data({this.ads, this.books, this.periodicals, this.course, this.osspath});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ads'] != null) {
      ads = new List<Ads>();
      json['ads'].forEach((v) {
        ads.add(new Ads.fromJson(v));
      });
    }
    books = json['books'] != null ? new Books.fromJson(json['books']) : null;
    periodicals = json['periodicals'] != null
        ? new Periodicals.fromJson(json['periodicals'])
        : null;
    course =
    json['course'] != null ? new Course.fromJson(json['course']) : null;
    osspath = json['osspath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ads != null) {
      data['ads'] = this.ads.map((v) => v.toJson()).toList();
    }
    if (this.books != null) {
      data['books'] = this.books.toJson();
    }
    if (this.periodicals != null) {
      data['periodicals'] = this.periodicals.toJson();
    }
    if (this.course != null) {
      data['course'] = this.course.toJson();
    }
    data['osspath'] = this.osspath;
    return data;
  }
}

class Ads {
  String createdTime;
  String updatedTime;
  String img;
  String redirectUrl;
  String endTime;
  String redirectSuffix;
  int sort;
  String title;
  String type;
  int createdBy;
  int redirectId;
  String startTime;
  int updatedBy;
  String name;
  int id;
  String status;

  Ads(
      {this.createdTime,
        this.updatedTime,
        this.img,
        this.redirectUrl,
        this.endTime,
        this.redirectSuffix,
        this.sort,
        this.title,
        this.type,
        this.createdBy,
        this.redirectId,
        this.startTime,
        this.updatedBy,
        this.name,
        this.id,
        this.status});

  Ads.fromJson(Map<String, dynamic> json) {
    createdTime = json['created_time'];
    updatedTime = json['updated_time'];
    img = json['img'];
    redirectUrl = json['redirectUrl'];
    endTime = json['end_time'];
    redirectSuffix = json['redirect_suffix'];
    sort = json['sort'];
    title = json['title'];
    type = json['type'];
    createdBy = json['created_by'];
    redirectId = json['redirect_id'];
    startTime = json['start_time'];
    updatedBy = json['updated_by'];
    name = json['name'];
    id = json['id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_time'] = this.createdTime;
    data['updated_time'] = this.updatedTime;
    data['img'] = this.img;
    data['redirectUrl'] = this.redirectUrl;
    data['end_time'] = this.endTime;
    data['redirect_suffix'] = this.redirectSuffix;
    data['sort'] = this.sort;
    data['title'] = this.title;
    data['type'] = this.type;
    data['created_by'] = this.createdBy;
    data['redirect_id'] = this.redirectId;
    data['start_time'] = this.startTime;
    data['updated_by'] = this.updatedBy;
    data['name'] = this.name;
    data['id'] = this.id;
    data['status'] = this.status;
    return data;
  }
}

class Books {
  List<Ndata> ndata;
  Ntype ntype;

  Books({this.ndata, this.ntype});

  Books.fromJson(Map<String, dynamic> json) {
    if (json['ndata'] != null) {
      ndata = new List<Ndata>();
      json['ndata'].forEach((v) {
        ndata.add(new Ndata.fromJson(v));
      });
    }
    ntype = json['ntype'] != null ? new Ntype.fromJson(json['ntype']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ndata != null) {
      data['ndata'] = this.ndata.map((v) => v.toJson()).toList();
    }
    if (this.ntype != null) {
      data['ntype'] = this.ntype.toJson();
    }
    return data;
  }
}

class Ndata {
  String createdTime;
  String homeRecommend;
  String thumb;
  String intro;
  String name;
  int id;
  int sort;
  String press;
  String status;

  Ndata(
      {this.createdTime,
        this.homeRecommend,
        this.thumb,
        this.intro,
        this.name,
        this.id,
        this.sort,
        this.press,
        this.status});

  Ndata.fromJson(Map<String, dynamic> json) {
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

class Ntype {
  int id;
  String title;
  String intro;
  int sort;
  String ntype;
  String status;
  String createdTime;
  int createdBy;
  String updatedTime;
  int updatedBy;

  Ntype(
      {this.id,
        this.title,
        this.intro,
        this.sort,
        this.ntype,
        this.status,
        this.createdTime,
        this.createdBy,
        this.updatedTime,
        this.updatedBy});

  Ntype.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    intro = json['intro'];
    sort = json['sort'];
    ntype = json['ntype'];
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
    data['intro'] = this.intro;
    data['sort'] = this.sort;
    data['ntype'] = this.ntype;
    data['status'] = this.status;
    data['createdTime'] = this.createdTime;
    data['createdBy'] = this.createdBy;
    data['updatedTime'] = this.updatedTime;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class Periodicals {
  List<PerNdata> ndata;
  Ntype ntype;

  Periodicals({this.ndata, this.ntype});

  Periodicals.fromJson(Map<String, dynamic> json) {
    if (json['ndata'] != null) {
      ndata = new List<PerNdata>();
      json['ndata'].forEach((v) {
        ndata.add(new PerNdata.fromJson(v));
      });
    }
    ntype = json['ntype'] != null ? new Ntype.fromJson(json['ntype']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ndata != null) {
      data['ndata'] = this.ndata.map((v) => v.toJson()).toList();
    }
    if (this.ntype != null) {
      data['ntype'] = this.ntype.toJson();
    }
    return data;
  }
}


class PerNdata {
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

  PerNdata(
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

  PerNdata.fromJson(Map<String, dynamic> json) {
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

class Course {
  List<CourseNdata> ndata;
  Ntype ntype;

  Course({this.ndata, this.ntype});

  Course.fromJson(Map<String, dynamic> json) {
    if (json['ndata'] != null) {
      ndata = new List<CourseNdata>();
      json['ndata'].forEach((v) {
        ndata.add(new CourseNdata.fromJson(v));
      });
    }
    ntype = json['ntype'] != null ? new Ntype.fromJson(json['ntype']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ndata != null) {
      data['ndata'] = this.ndata.map((v) => v.toJson()).toList();
    }
    if (this.ntype != null) {
      data['ntype'] = this.ntype.toJson();
    }
    return data;
  }
}


class CourseNdata {
  String thumbBig;
  String thumb;
  double price;
  String intro;
  String isFree;
  int id;
  int sort;
  String title;

  CourseNdata(
      {this.thumbBig,
        this.thumb,
        this.price,
        this.intro,
        this.isFree,
        this.id,
        this.sort,
        this.title});

  CourseNdata.fromJson(Map<String, dynamic> json) {
    thumbBig = json['thumb_big'];
    thumb = json['thumb'];
    price = json['price'];
    intro = json['intro'];
    isFree = json['is_free'];
    id = json['id'];
    sort = json['sort'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb_big'] = this.thumbBig;
    data['thumb'] = this.thumb;
    data['price'] = this.price;
    data['intro'] = this.intro;
    data['is_free'] = this.isFree;
    data['id'] = this.id;
    data['sort'] = this.sort;
    data['title'] = this.title;
    return data;
  }
}
