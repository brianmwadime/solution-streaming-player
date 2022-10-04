class Paginator {
  int? itemCount;
  int? perPage;
  int? pageCount;
  int? currentPage;

  Paginator({this.itemCount, this.perPage, this.pageCount, this.currentPage});

  Paginator.fromJson(Map<String, dynamic> json) {
    itemCount = json['itemCount'];
    perPage = json['perPage'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.itemCount != null) {
      data['itemCount'] = this.itemCount;
    }
    if (this.perPage != null) {
      data['perPage'] = this.perPage;
    }
    if (this.pageCount != null) {
      data['pageCount'] = this.pageCount;
    }
    if (this.currentPage != null) {
      data['currentPage'] = this.currentPage;
    }
    return data;
  }
}
