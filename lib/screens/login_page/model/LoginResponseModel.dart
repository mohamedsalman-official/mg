class LoginResponse {
  bool? status;
  String? message;
  Data? data;

  LoginResponse({this.status, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  Null? mobileNumberVerifiedAt;
  Null? landline;
  String? contactNumber;
  String? email;
  String? emailVerifiedAt;
  Null? alternativeEmail;
  String? password;
  String? mobileNo;
  Null? firstName;
  Null? lastName;
  String? dob;
  Null? gender;
  Null? profileImgPath;
  Null? latitude;
  Null? longitude;
  String? address1;
  String? address2;
  Null? cityId;
  int? stateId;
  int? countryId;
  Null? postalCode;
  Null? aadhaarCardNumber;
  Null? panCardNumber;
  Null? contactPerson;
  String? token;
  Null? tokenExpiry;
  Null? refreshToken;
  Null? createdBy;
  Null? onBoardingMode;
  String? registerFrom;
  Null? dateOfJoin;
  Null? isDocumentVerified;
  String? companyName;
  Null? corporateId;
  Null? providerId;
  Null? departmentId;
  Null? roleId;
  Null? defaultRoleId;
  Null? userCode;
  int? catHead;
  int? catLead;
  int? isVerified;
  Null? isDraft;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? menuList;
  List<Roles>? roles;
  List<Null>? userOrgDepts;

  Data(
      {this.id,
      this.name,
      this.mobileNumberVerifiedAt,
      this.landline,
      this.contactNumber,
      this.email,
      this.emailVerifiedAt,
      this.alternativeEmail,
      this.password,
      this.mobileNo,
      this.firstName,
      this.lastName,
      this.dob,
      this.gender,
      this.profileImgPath,
      this.latitude,
      this.longitude,
      this.address1,
      this.address2,
      this.cityId,
      this.stateId,
      this.countryId,
      this.postalCode,
      this.aadhaarCardNumber,
      this.panCardNumber,
      this.contactPerson,
      this.token,
      this.tokenExpiry,
      this.refreshToken,
      this.createdBy,
      this.onBoardingMode,
      this.registerFrom,
      this.dateOfJoin,
      this.isDocumentVerified,
      this.companyName,
      this.corporateId,
      this.providerId,
      this.departmentId,
      this.roleId,
      this.defaultRoleId,
      this.userCode,
      this.catHead,
      this.catLead,
      this.isVerified,
      this.isDraft,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.menuList,
      this.roles,
      this.userOrgDepts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumberVerifiedAt = json['mobile_number_verified_at'];
    landline = json['landline'];
    contactNumber = json['contact_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    alternativeEmail = json['alternative_email'];
    password = json['password'];
    mobileNo = json['mobile_no'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    dob = json['dob'];
    gender = json['gender'];
    profileImgPath = json['profile_img_path'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address1 = json['address1'];
    address2 = json['address2'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    countryId = json['country_id'];
    postalCode = json['postal_code'];
    aadhaarCardNumber = json['aadhaar_card_number'];
    panCardNumber = json['pan_card_number'];
    contactPerson = json['contact_person'];
    token = json['token'];
    tokenExpiry = json['token_expiry'];
    refreshToken = json['refresh_token'];
    createdBy = json['created_by'];
    onBoardingMode = json['on_boarding_mode'];
    registerFrom = json['register_from'];
    dateOfJoin = json['date_of_join'];
    isDocumentVerified = json['is_document_verified'];
    companyName = json['company_name'];
    corporateId = json['corporate_id'];
    providerId = json['provider_id'];
    departmentId = json['department_id'];
    roleId = json['role_id'];
    defaultRoleId = json['default_role_id'];
    userCode = json['user_code'];
    catHead = json['cat_head'];
    catLead = json['cat_lead'];
    isVerified = json['is_verified'];
    isDraft = json['is_draft'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    menuList = json['menuList'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
    // if (json['user_org_depts'] != null) {
    //   userOrgDepts = <Null>[];
    //   json['user_org_depts'].forEach((v) {
    //     userOrgDepts!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile_number_verified_at'] = this.mobileNumberVerifiedAt;
    data['landline'] = this.landline;
    data['contact_number'] = this.contactNumber;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['alternative_email'] = this.alternativeEmail;
    data['password'] = this.password;
    data['mobile_no'] = this.mobileNo;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['profile_img_path'] = this.profileImgPath;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['country_id'] = this.countryId;
    data['postal_code'] = this.postalCode;
    data['aadhaar_card_number'] = this.aadhaarCardNumber;
    data['pan_card_number'] = this.panCardNumber;
    data['contact_person'] = this.contactPerson;
    data['token'] = this.token;
    data['token_expiry'] = this.tokenExpiry;
    data['refresh_token'] = this.refreshToken;
    data['created_by'] = this.createdBy;
    data['on_boarding_mode'] = this.onBoardingMode;
    data['register_from'] = this.registerFrom;
    data['date_of_join'] = this.dateOfJoin;
    data['is_document_verified'] = this.isDocumentVerified;
    data['company_name'] = this.companyName;
    data['corporate_id'] = this.corporateId;
    data['provider_id'] = this.providerId;
    data['department_id'] = this.departmentId;
    data['role_id'] = this.roleId;
    data['default_role_id'] = this.defaultRoleId;
    data['user_code'] = this.userCode;
    data['cat_head'] = this.catHead;
    data['cat_lead'] = this.catLead;
    data['is_verified'] = this.isVerified;
    data['is_draft'] = this.isDraft;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['menuList'] = this.menuList;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    // if (this.userOrgDepts != null) {
    //   data['user_org_depts'] =
    //       this.userOrgDepts!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Roles {
  int? id;
  String? roleName;
  int? value;
  Null? description;
  int? status;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Roles(
      {this.id,
      this.roleName,
      this.value,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['role_name'];
    value = json['value'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_name'] = this.roleName;
    data['value'] = this.value;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? roleId;
  String? userCode;
  String? createdAt;
  String? updatedAt;

  Pivot(
      {this.userId,
      this.roleId,
      this.userCode,
      this.createdAt,
      this.updatedAt});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    roleId = json['role_id'];
    userCode = json['user_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['role_id'] = this.roleId;
    data['user_code'] = this.userCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
