class Count {
  Status? status;
  List<Data>? data;

  Count({this.status, this.data});

  Count.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  int? code;
  String? description;

  Status({this.code, this.description});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}

class Data {
  int? newType;
  int? suspendType;
  int? reconnectType;
  int? terminateType;
  int? modifyType;

  Data(
      {this.newType,
      this.suspendType,
      this.reconnectType,
      this.terminateType,
      this.modifyType});

  Data.fromJson(Map<String, dynamic> json) {
    newType = json['new_type'];
    suspendType = json['suspend_type'];
    reconnectType = json['reconnect_type'];
    terminateType = json['terminate_type'];
    modifyType = json['modify_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new_type'] = this.newType;
    data['suspend_type'] = this.suspendType;
    data['reconnect_type'] = this.reconnectType;
    data['terminate_type'] = this.terminateType;
    data['modify_type'] = this.modifyType;
    return data;
  }
}
