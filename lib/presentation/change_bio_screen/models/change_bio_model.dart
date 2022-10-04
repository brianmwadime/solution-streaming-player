class ChangeBioModel {
  int? id;
  String? username;
  String? email;
  String? name;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? addedBy;
  int? updatedBy;
  String? nationalId;
  String? kraPin;
  int? userType;
  String? mobileNo;
  bool? isDeleted;

  ChangeBioModel(
      {this.id,
      this.username,
      this.email,
      this.name,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.updatedBy,
      this.nationalId,
      this.kraPin,
      this.userType,
      this.mobileNo,
      this.isDeleted});
}
