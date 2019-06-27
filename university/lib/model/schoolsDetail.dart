class SchoolsDetailsModel {
  String code;
  String message;
  SchoolsDetailsData data;
  String md5;

  SchoolsDetailsModel({this.code, this.message, this.data, this.md5});

  SchoolsDetailsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new SchoolsDetailsData.fromJson(json['data']) : null;
    md5 = json['md5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['md5'] = this.md5;
    return data;
  }
}

class SchoolsDetailsData {
  int numFound;
  List<Item> item;

  SchoolsDetailsData({this.numFound, this.item});

  SchoolsDetailsData.fromJson(Map<String, dynamic> json) {
    numFound = json['numFound'];
    if (json['item'] != null) {
      item = new List<Item>();
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numFound'] = this.numFound;
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String schoolId;
  String type;
  String max;
  String min;
  String average;
  String minSection;
  String province;
  String batch;
  String proscore;
  String localBatchName;

  Item(
      {this.schoolId,
      this.type,
      this.max,
      this.min,
      this.average,
      this.minSection,
      this.province,
      this.batch,
      this.proscore,
      this.localBatchName});

  Item.fromJson(Map<String, dynamic> json) {
    schoolId = json['school_id'];
    type = json['type'];
    max = json['max'];
    min = json['min'];
    average = json['average'];
    minSection = json['min_section'];
    province = json['province'];
    batch = json['batch'];
    proscore = json['proscore'];
    localBatchName = json['local_batch_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school_id'] = this.schoolId;
    data['type'] = this.type;
    data['max'] = this.max;
    data['min'] = this.min;
    data['average'] = this.average;
    data['min_section'] = this.minSection;
    data['province'] = this.province;
    data['batch'] = this.batch;
    data['proscore'] = this.proscore;
    data['local_batch_name'] = this.localBatchName;
    return data;
  }
}