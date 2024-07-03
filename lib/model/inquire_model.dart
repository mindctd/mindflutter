class InquireResponse {
  int? page;
  int? pageSize;
  Items? items;

  InquireResponse({this.page, this.pageSize, this.items});

  InquireResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['page_size'];
    items = json['items'] != null ? new Items.fromJson(json['items']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    if (this.items != null) {
      data['items'] = this.items!.toJson();
    }
    return data;
  }
}

class Items {
  String? approvalStatusValue;
  String? taskType;
  String? orderId;

  Items({this.approvalStatusValue, this.taskType, this.orderId});

  Items.fromJson(Map<String, dynamic> json) {
    approvalStatusValue = json['approval_status_value'];
    taskType = json['task_type'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approval_status_value'] = this.approvalStatusValue;
    data['task_type'] = this.taskType;
    data['order_id'] = this.orderId;
    return data;
  }
}