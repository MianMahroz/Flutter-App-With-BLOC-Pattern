class AuthenticateUserRequestDto {
  String userId;
  String requestFrom;
  String userPassword;

  AuthenticateUserRequestDto(
      {this.userId, this.requestFrom, this.userPassword});

  AuthenticateUserRequestDto.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    requestFrom = json['requestFrom'];
    userPassword = json['userPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['requestFrom'] = this.requestFrom;
    data['userPassword'] = this.userPassword;
    return data;
  }
}