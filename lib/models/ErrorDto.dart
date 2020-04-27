class ErrorDto {
  int statusCode;
  String errorMsg;
  String message;
  String localizaedKey;
  Null data;

  ErrorDto(
      {this.statusCode,
        this.errorMsg,
        this.message,
        this.localizaedKey,
        this.data});

  ErrorDto.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    errorMsg = json['errorMsg'];
    message = json['message'];
    localizaedKey = json['localizaedKey'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['errorMsg'] = this.errorMsg;
    data['message'] = this.message;
    data['localizaedKey'] = this.localizaedKey;
    data['data'] = this.data;
    return data;
  }
}
