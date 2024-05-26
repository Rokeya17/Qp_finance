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
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['message'] = message;
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
    data['_id'] = sId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['profile_pic'] = profilePic;
    data['cover_pic'] = coverPic;
    data['user_status'] = userStatus;
    if (gender != null) {
      data['gender'] = gender!.toJson();
    }
    if (religion != null) {
      data['religion'] = religion!.toJson();
    }
    data['date_of_birth'] = dateOfBirth;
    data['user_bio'] = userBio;
    data['language'] = language;
    data['passport'] = passport;
    data['last_login'] = lastLogin;
    data['user_2fa_status'] = user2faStatus;
    data['secondary_email'] = secondaryEmail;
    data['recovery_email'] = recoveryEmail;
    data['relation_status'] = relationStatus;
    data['home_town'] = homeTown;
    data['birth_place'] = birthPlace;
    data['blood_group'] = bloodGroup;
    data['reset_password_token'] = resetPasswordToken;
    data['reset_password_token_expires'] = resetPasswordTokenExpires;
    data['user_role'] = userRole;
    data['status'] = status;
    data['ip_address'] = ipAddress;
    data['created_by'] = createdBy;
    data['update_by'] = updateBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['lock_profile'] = lockProfile;
    data['email_list'] = emailList;
    data['phone_list'] = phoneList;
    data['user_about'] = userAbout;
    data['user_nickname'] = userNickname;
    data['present_town'] = presentTown;
    data['fullName'] = fullName;
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
    data['_id'] = sId;
    data['gender_name'] = genderName;
    data['data_status'] = dataStatus;
    data['ip_address'] = ipAddress;
    data['created_by'] = createdBy;
    data['update_by'] = updateBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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
    data['_id'] = sId;
    data['religion_name'] = religionName;
    data['data_status'] = dataStatus;
    data['ip_address'] = ipAddress;
    data['created_by'] = createdBy;
    data['update_by'] = updateBy;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
