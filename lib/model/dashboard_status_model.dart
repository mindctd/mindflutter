class Status2 {
  String? userId;
  String? billingAccId;
  String? date;
  String? statusOrder;
  int? page;
  int? pageSize;

  Status2(
      {this.userId,
      this.billingAccId,
      this.date,
      this.statusOrder,
      this.page,
      this.pageSize});

  Status2.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    billingAccId = json['billing_acc_id'];
    date = json['date'];
    statusOrder = json['status_order'];
    page = json['page'];
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['billing_acc_id'] = this.billingAccId;
    data['date'] = this.date;
    data['status_order'] = this.statusOrder;
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    return data;
  }
}
