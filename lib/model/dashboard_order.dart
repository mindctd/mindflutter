class OrderDashboard {
  Status? status;
  DataOrder? data;

  OrderDashboard({this.status, this.data});

  OrderDashboard.fromJson(Map<String, dynamic> json) {
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    data = json['data'] != null ? new DataOrder.fromJson(json['data']) : null;
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

class DataOrder {
  Summary? summary;
  Inprogress? inprogress;

  DataOrder({this.summary, this.inprogress});

  DataOrder.fromJson(Map<String, dynamic> json) {
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    inprogress = json['inprogress'] != null
        ? new Inprogress.fromJson(json['inprogress'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.inprogress != null) {
      data['inprogress'] = this.inprogress!.toJson();
    }
    return data;
  }
}

class Summary {
  NewSum? newSum;
  NewSum? provisionningSum;
  NewSum? billingSum;
  NewSum? completeSum;

  Summary(
      {this.newSum, this.provisionningSum, this.billingSum, this.completeSum});

  Summary.fromJson(Map<String, dynamic> json) {
    newSum =
        json['new_sum'] != null ? new NewSum.fromJson(json['new_sum']) : null;
    provisionningSum = json['provisionning_sum'] != null
        ? new NewSum.fromJson(json['provisionning_sum'])
        : null;
    billingSum = json['billing_sum'] != null
        ? new NewSum.fromJson(json['billing_sum'])
        : null;
    completeSum = json['complete_sum'] != null
        ? new NewSum.fromJson(json['complete_sum'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newSum != null) {
      data['new_sum'] = this.newSum!.toJson();
    }
    if (this.provisionningSum != null) {
      data['provisionning_sum'] = this.provisionningSum!.toJson();
    }
    if (this.billingSum != null) {
      data['billing_sum'] = this.billingSum!.toJson();
    }
    if (this.completeSum != null) {
      data['complete_sum'] = this.completeSum!.toJson();
    }
    return data;
  }
}

class NewSum {
  int? values;
  int? items;

  NewSum({this.values, this.items});

  NewSum.fromJson(Map<String, dynamic> json) {
    values = json['values'];
    items = json['items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['values'] = this.values;
    data['items'] = this.items;
    return data;
  }
}

class Inprogress {
  OverDue? overDue;
  OverDue? atRisk;
  OverDue? dueThisWeek;
  OverDue? dueThisMonth;

  Inprogress({this.overDue, this.atRisk, this.dueThisWeek, this.dueThisMonth});

  Inprogress.fromJson(Map<String, dynamic> json) {
    overDue = json['over_due'] != null
        ? new OverDue.fromJson(json['over_due'])
        : null;
    atRisk =
        json['at_risk'] != null ? new OverDue.fromJson(json['at_risk']) : null;
    dueThisWeek = json['due_this_week'] != null
        ? new OverDue.fromJson(json['due_this_week'])
        : null;
    dueThisMonth = json['due_this_month'] != null
        ? new OverDue.fromJson(json['due_this_month'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.overDue != null) {
      data['over_due'] = this.overDue!.toJson();
    }
    if (this.atRisk != null) {
      data['at_risk'] = this.atRisk!.toJson();
    }
    if (this.dueThisWeek != null) {
      data['due_this_week'] = this.dueThisWeek!.toJson();
    }
    if (this.dueThisMonth != null) {
      data['due_this_month'] = this.dueThisMonth!.toJson();
    }
    return data;
  }
}

class OverDue {
  int? totalItem;
  int? newItem;
  int? provisioningItem;
  int? billingItem;

  OverDue(
      {this.totalItem, this.newItem, this.provisioningItem, this.billingItem});

  OverDue.fromJson(Map<String, dynamic> json) {
    totalItem = json['total_item'];
    newItem = json['new_item'];
    provisioningItem = json['provisioning_item'];
    billingItem = json['billing_item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_item'] = this.totalItem;
    data['new_item'] = this.newItem;
    data['provisioning_item'] = this.provisioningItem;
    data['billing_item'] = this.billingItem;
    return data;
  }
}
