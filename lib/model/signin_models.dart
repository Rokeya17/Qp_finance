class SignInModel {
  int? status;
  User? user;
  String? accessToken;
  String? refreshToken;
  String? message;

  SignInModel(
      {this.status,
      this.user,
      this.accessToken,
      this.refreshToken,
      this.message});

  SignInModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    data['message'] = this.message;
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phone;
  String? profilePic;
  String? coverPic;
  String? userStatus;
  Gender? gender;
  Religion? religion;
  String? dateOfBirth;
  String? userBio;
  String? language;
  String? passport;
  String? lastLogin;
  String? user2faStatus;
  String? secondaryEmail;
  String? recoveryEmail;
  String? relationStatus;
  String? homeTown;
  String? birthPlace;
  String? bloodGroup;
  String? resetPasswordToken;
  String? resetPasswordTokenExpires;
  int? userRole;
  int? status;
  int? ipAddress;
  int? createdBy;
  int? updateBy;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? lockProfile;
  List<String>? emailList;
  List<String>? phoneList;
  String? userAbout;
  String? userNickname;
  String? presentTown;
  String? fullName;

  User(
      {this.sId,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.phone,
      this.profilePic,
      this.coverPic,
      this.userStatus,
      this.gender,
      this.religion,
      this.dateOfBirth,
      this.userBio,
      this.language,
      this.passport,
      this.lastLogin,
      this.user2faStatus,
      this.secondaryEmail,
      this.recoveryEmail,
      this.relationStatus,
      this.homeTown,
      this.birthPlace,
      this.bloodGroup,
      this.resetPasswordToken,
      this.resetPasswordTokenExpires,
      this.userRole,
      this.status,
      this.ipAddress,
      this.createdBy,
      this.updateBy,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.lockProfile,
      this.emailList,
      this.phoneList,
      this.userAbout,
      this.userNickname,
      this.presentTown,
      this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    profilePic = json['profile_pic'];
    coverPic = json['cover_pic'];
    userStatus = json['user_status'];
    gender =
        json['gender'] != null ? new Gender.fromJson(json['gender']) : null;
    religion = json['religion'] != null
        ? new Religion.fromJson(json['religion'])
        : null;
    dateOfBirth = json['date_of_birth'];
    userBio = json['user_bio'];
    language = json['language'];
    passport = json['passport'];
    lastLogin = json['last_login'];
    user2faStatus = json['user_2fa_status'];
    secondaryEmail = json['secondary_email'];
    recoveryEmail = json['recovery_email'];
    relationStatus = json['relation_status'];
    homeTown = json['home_town'];
    birthPlace = json['birth_place'];
    bloodGroup = json['blood_group'];
    resetPasswordToken = json['reset_password_token'];
    resetPasswordTokenExpires = json['reset_password_token_expires'];
    userRole = json['user_role'];
    status = json['status'];
    ipAddress = json['ip_address'];
    createdBy = json['created_by'];
    updateBy = json['update_by'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    lockProfile = json['lock_profile'];
    emailList = json['email_list'].cast<String>();
    phoneList = json['phone_list'].cast<String>();
    userAbout = json['user_about'];
    userNickname = json['user_nickname'];
    presentTown = json['present_town'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['profile_pic'] = this.profilePic;
    data['cover_pic'] = this.coverPic;
    data['user_status'] = this.userStatus;
    if (this.gender != null) {
      data['gender'] = this.gender!.toJson();
    }
    if (this.religion != null) {
      data['religion'] = this.religion!.toJson();
    }
    data['date_of_birth'] = this.dateOfBirth;
    data['user_bio'] = this.userBio;
    data['language'] = this.language;
    data['passport'] = this.passport;
    data['last_login'] = this.lastLogin;
    data['user_2fa_status'] = this.user2faStatus;
    data['secondary_email'] = this.secondaryEmail;
    data['recovery_email'] = this.recoveryEmail;
    data['relation_status'] = this.relationStatus;
    data['home_town'] = this.homeTown;
    data['birth_place'] = this.birthPlace;
    data['blood_group'] = this.bloodGroup;
    data['reset_password_token'] = this.resetPasswordToken;
    data['reset_password_token_expires'] = this.resetPasswordTokenExpires;
    data['user_role'] = this.userRole;
    data['status'] = this.status;
    data['ip_address'] = this.ipAddress;
    data['created_by'] = this.createdBy;
    data['update_by'] = this.updateBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['lock_profile'] = this.lockProfile;
    data['email_list'] = this.emailList;
    data['phone_list'] = this.phoneList;
    data['user_about'] = this.userAbout;
    data['user_nickname'] = this.userNickname;
    data['present_town'] = this.presentTown;
    data['fullName'] = this.fullName;
    return data;
  }
}

class Gender {
  String? sId;
  String? genderName;
  String? dataStatus;
  String? ipAddress;
  String? createdBy;
  String? updateBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Gender(
      {this.sId,
      this.genderName,
      this.dataStatus,
      this.ipAddress,
      this.createdBy,
      this.updateBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Gender.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    genderName = json['gender_name'];
    dataStatus = json['data_status'];
    ipAddress = json['ip_address'];
    createdBy = json['created_by'];
    updateBy = json['update_by'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['gender_name'] = this.genderName;
    data['data_status'] = this.dataStatus;
    data['ip_address'] = this.ipAddress;
    data['created_by'] = this.createdBy;
    data['update_by'] = this.updateBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Religion {
  String? sId;
  String? religionName;
  String? dataStatus;
  String? ipAddress;
  String? createdBy;
  String? updateBy;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Religion(
      {this.sId,
      this.religionName,
      this.dataStatus,
      this.ipAddress,
      this.createdBy,
      this.updateBy,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Religion.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    religionName = json['religion_name'];
    dataStatus = json['data_status'];
    ipAddress = json['ip_address'];
    createdBy = json['created_by'];
    updateBy = json['update_by'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['religion_name'] = this.religionName;
    data['data_status'] = this.dataStatus;
    data['ip_address'] = this.ipAddress;
    data['created_by'] = this.createdBy;
    data['update_by'] = this.updateBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
