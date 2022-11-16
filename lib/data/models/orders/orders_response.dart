import 'package:solution_ke/data/models/paginator.dart';
import 'package:solution_ke/data/models/updateProfile/profile_response.dart';

class UserOrdersResponse {
  String? status;
  String? message;
  Data? data;

  UserOrdersResponse({this.status, this.message, this.data});

  UserOrdersResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<UserOrder>? data;
  Paginator? paginator;

  Data({this.data, this.paginator});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserOrder>[];
      json['data'].forEach((v) {
        data!.add(new UserOrder.fromJson(v));
      });
    }
    paginator = json['paginator'] != null
        ? new Paginator.fromJson(json['paginator'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paginator != null) {
      data['paginator'] = this.paginator!.toJson();
    }
    return data;
  }
}

class UserOrder {
  int? id;
  int? userId;
  String? orderStatus;
  dynamic timePaid;
  String? totalPrice;
  String? discount;
  String? finalPrice;
  bool? isDeleted;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? addedBy;
  int? updatedBy;
  dynamic paymentData;
  String? channel;
  String? paymentReference;
  UserProfile? user;

  UserOrder(
      {this.id,
      this.userId,
      this.orderStatus,
      this.timePaid,
      this.totalPrice,
      this.discount,
      this.finalPrice,
      this.isDeleted,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.updatedBy,
      this.paymentData,
      this.channel,
      this.paymentReference,
      this.user});

  UserOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    orderStatus = json['orderStatus'];
    timePaid = json['timePaid'];
    totalPrice = json['totalPrice'];
    discount = json['discount'];
    finalPrice = json['finalPrice'];
    isDeleted = json['isDeleted'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    addedBy = json['addedBy'];
    updatedBy = json['updatedBy'];
    paymentData = json['paymentData'];
    channel = json['channel'];
    paymentReference = json['paymentReference'];
    user = json['_addedBy'] != null
        ? new UserProfile.fromJson(json['_addedBy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['orderStatus'] = this.orderStatus;
    data['timePaid'] = this.timePaid;
    data['totalPrice'] = this.totalPrice;
    data['discount'] = this.discount;
    data['finalPrice'] = this.finalPrice;
    data['isDeleted'] = this.isDeleted;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['addedBy'] = this.addedBy;
    data['updatedBy'] = this.updatedBy;
    data['paymentData'] = this.paymentData;
    data['channel'] = this.channel;
    data['paymentReference'] = this.paymentReference;
    if (this.user != null) {
      data['_addedBy'] = this.user!.toJson();
    }
    return data;
  }
}
