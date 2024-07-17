class Status2 {
  Status? status;
  StatusData? data;

  Status2({this.status, this.data});

  Status2.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new StatusData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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

class StatusData {
  int? totalRecord;
  int? currentPage;
  int? pageSize;
  List<Items>? items;

  StatusData({this.totalRecord, this.currentPage, this.pageSize, this.items});

  StatusData.fromJson(Map<String, dynamic> json) {
    totalRecord = json['total_record'];
    currentPage = json['current_page'];
    pageSize = json['page_size'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_record'] = this.totalRecord;
    data['current_page'] = this.currentPage;
    data['page_size'] = this.pageSize;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? orderTypeLkp;
  String? orderTypeLkpName;
  String? orderSubTypeLkp;
  String? orderSubTypeLkpName;
  String? customerFullName;
  String? customerId;
  String? baId;
  int? newStatus;
  int? provisioning;
  int? billing;
  int? complete;
  int? totalItems;
  int? newStatusPer;
  int? provisioningPer;
  int? billingPer;
  int? completePer;
  int? resultCount;

  Items(
      {this.id,
      this.orderTypeLkp,
      this.orderTypeLkpName,
      this.orderSubTypeLkp,
      this.orderSubTypeLkpName,
      this.customerFullName,
      this.customerId,
      this.baId,
      this.newStatus,
      this.provisioning,
      this.billing,
      this.complete,
      this.totalItems,
      this.newStatusPer,
      this.provisioningPer,
      this.billingPer,
      this.completePer,
      this.resultCount});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderTypeLkp = json['order_type_lkp'];
    orderTypeLkpName = json['order_type_lkp_name'];
    orderSubTypeLkp = json['order_sub_type_lkp'];
    orderSubTypeLkpName = json['order_sub_type_lkp_name'];
    customerFullName = json['customer_full_name'];
    customerId = json['customer_id'];
    baId = json['ba_id'];
    newStatus = json['new_status'];
    provisioning = json['provisioning'];
    billing = json['billing'];
    complete = json['complete'];
    totalItems = json['total_items'];
    newStatusPer = json['new_status_per'];
    provisioningPer = json['provisioning_per'];
    billingPer = json['billing_per'];
    completePer = json['complete_per'];
    resultCount = json['result_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_type_lkp'] = this.orderTypeLkp;
    data['order_type_lkp_name'] = this.orderTypeLkpName;
    data['order_sub_type_lkp'] = this.orderSubTypeLkp;
    data['order_sub_type_lkp_name'] = this.orderSubTypeLkpName;
    data['customer_full_name'] = this.customerFullName;
    data['customer_id'] = this.customerId;
    data['ba_id'] = this.baId;
    data['new_status'] = this.newStatus;
    data['provisioning'] = this.provisioning;
    data['billing'] = this.billing;
    data['complete'] = this.complete;
    data['total_items'] = this.totalItems;
    data['new_status_per'] = this.newStatusPer;
    data['provisioning_per'] = this.provisioningPer;
    data['billing_per'] = this.billingPer;
    data['complete_per'] = this.completePer;
    data['result_count'] = this.resultCount;
    return data;
  }
}
