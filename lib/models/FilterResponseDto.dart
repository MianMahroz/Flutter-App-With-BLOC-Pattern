class FilterResponseDto {
  String modelIdPk;
  String makeIdFk;
  int companyId;
  int miocnId;
  String assetTypeId;
  String assetSubTypeId;
  String financialGroupId;
  bool activeInd;
  int creationDate;
  double listPrice;
  String imagePath;
  String lastUpdated;
  String transmissionTypeCode;
  int updationDate;
  String createdBy;
  String updatedBy;
  String modelName;
  String fieldsJson;
  String passangerCapacity;
  String subsidy;
  String assetCondition;
  String engineNo;
  String engineCc;
  String cylinder;
  String tyres;
  String color;
  String body;
  String style;
  String odometer;
  int terms;
  String rentalAmount;
  double financialAmount;
  double depositAmount;
  String makeIdPk;
  String makeName;
  String makeImageUrl;
  String theme;
  List<FinancialChartList> financialChartList;
  String transmissionType;
  bool selected = false;

  FilterResponseDto(
      {this.modelIdPk,
      this.makeIdFk,
      this.companyId,
      this.miocnId,
      this.assetTypeId,
      this.assetSubTypeId,
      this.financialGroupId,
      this.activeInd,
      this.creationDate,
      this.listPrice,
      this.imagePath,
      this.lastUpdated,
      this.transmissionTypeCode,
      this.updationDate,
      this.createdBy,
      this.updatedBy,
      this.modelName,
      this.fieldsJson,
      this.passangerCapacity,
      this.subsidy,
      this.assetCondition,
      this.engineNo,
      this.engineCc,
      this.cylinder,
      this.tyres,
      this.color,
      this.body,
      this.style,
      this.odometer,
      this.terms,
      this.rentalAmount,
      this.financialAmount,
      this.depositAmount,
      this.makeIdPk,
      this.makeName,
      this.makeImageUrl,
      this.theme,
      this.financialChartList,
      this.transmissionType,
      this.selected});

  FilterResponseDto.fromJson(Map<String, dynamic> json) {
    selected = false;
    modelIdPk = json['modelIdPk'];
    makeIdFk = json['makeIdFk'];
    companyId = json['companyId'];
    miocnId = json['miocnId'];
    assetTypeId = json['assetTypeId'];
    assetSubTypeId = json['assetSubTypeId'];
    financialGroupId = json['financialGroupId'];
    activeInd = json['activeInd'];
    creationDate = json['creationDate'];
    listPrice = json['listPrice'];
    imagePath = json['imagePath'];
    lastUpdated = json['lastUpdated'];
    transmissionTypeCode = json['transmissionTypeCode'];
    updationDate = json['updationDate'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
    modelName = json['modelName'];
    fieldsJson = json['fieldsJson'];
    passangerCapacity = json['passangerCapacity'];
    subsidy = json['subsidy'];
    assetCondition = json['assetCondition'];
    engineNo = json['engineNo'];
    engineCc = json['engineCc'];
    cylinder = json['cylinder'];
    tyres = json['tyres'];
    color = json['color'];
    body = json['body'];
    style = json['style'];
    odometer = json['odometer'];
    terms = json['terms'];
    rentalAmount = json['rentalAmount'];
    financialAmount = json['financialAmount'];
    depositAmount = json['depositAmount'];
    makeIdPk = json['makeIdPk'];
    makeName = json['makeName'];
    makeImageUrl = json['makeImageUrl'];
    theme = json['theme'];
    if (json['financialChartList'] != null) {
      financialChartList = new List<FinancialChartList>();
      json['financialChartList'].forEach((v) {
        financialChartList.add(new FinancialChartList.fromJson(v));
      });
    }
    transmissionType = json['transmissionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modelIdPk'] = this.modelIdPk;
    data['makeIdFk'] = this.makeIdFk;
    data['companyId'] = this.companyId;
    data['miocnId'] = this.miocnId;
    data['assetTypeId'] = this.assetTypeId;
    data['assetSubTypeId'] = this.assetSubTypeId;
    data['financialGroupId'] = this.financialGroupId;
    data['activeInd'] = this.activeInd;
    data['creationDate'] = this.creationDate;
    data['listPrice'] = this.listPrice;
    data['imagePath'] = this.imagePath;
    data['lastUpdated'] = this.lastUpdated;
    data['transmissionTypeCode'] = this.transmissionTypeCode;
    data['updationDate'] = this.updationDate;
    data['createdBy'] = this.createdBy;
    data['updatedBy'] = this.updatedBy;
    data['modelName'] = this.modelName;
    data['fieldsJson'] = this.fieldsJson;
    data['passangerCapacity'] = this.passangerCapacity;
    data['subsidy'] = this.subsidy;
    data['assetCondition'] = this.assetCondition;
    data['engineNo'] = this.engineNo;
    data['engineCc'] = this.engineCc;
    data['cylinder'] = this.cylinder;
    data['tyres'] = this.tyres;
    data['color'] = this.color;
    data['body'] = this.body;
    data['style'] = this.style;
    data['odometer'] = this.odometer;
    data['terms'] = this.terms;
    data['rentalAmount'] = this.rentalAmount;
    data['financialAmount'] = this.financialAmount;
    data['depositAmount'] = this.depositAmount;
    data['makeIdPk'] = this.makeIdPk;
    data['makeName'] = this.makeName;
    data['makeImageUrl'] = this.makeImageUrl;
    data['theme'] = this.theme;
    if (this.financialChartList != null) {
      data['financialChartList'] =
          this.financialChartList.map((v) => v.toJson()).toList();
    }
    data['transmissionType'] = this.transmissionType;
    return data;
  }
}

class FinancialChartList {
  int id;
  String modelId;
  String makeId;
  String assetTypeId;
  int terms;
  double downPayment;
  double financeAmount;
  String rentalAmount;
  Null createdAt;

  FinancialChartList(
      {this.id,
      this.modelId,
      this.makeId,
      this.assetTypeId,
      this.terms,
      this.downPayment,
      this.financeAmount,
      this.rentalAmount,
      this.createdAt});

  FinancialChartList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelId = json['modelId'];
    makeId = json['makeId'];
    assetTypeId = json['assetTypeId'];
    terms = json['terms'];
    downPayment = json['downPayment'];
    financeAmount = json['financeAmount'];
    rentalAmount = json['rentalAmount'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['modelId'] = this.modelId;
    data['makeId'] = this.makeId;
    data['assetTypeId'] = this.assetTypeId;
    data['terms'] = this.terms;
    data['downPayment'] = this.downPayment;
    data['financeAmount'] = this.financeAmount;
    data['rentalAmount'] = this.rentalAmount;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
