class FilterRequestDto {
  int companyId;
  bool oto;
  String budget;
  String monthlyBudget;
  List<String> modelType;
  bool isSelected;
  String userId;
  List<String> assetType;
  List<String> make;

  FilterRequestDto(
      {this.companyId,
        this.oto,
        this.budget,
        this.monthlyBudget,
        this.modelType,
        this.isSelected,
        this.userId,
        this.assetType,
        this.make});

  FilterRequestDto.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    oto = json['oto'];
    budget = json['budget'];
    monthlyBudget = json['monthlyBudget'];
    modelType = json['modelType'].cast<String>();
    isSelected = json['isSelected'];
    userId = json['userId'];
    assetType = json['assetType'].cast<String>();
    make = json['make'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['oto'] = this.oto;
    data['budget'] = this.budget;
    data['monthlyBudget'] = this.monthlyBudget;
    data['modelType'] = this.modelType;
    data['isSelected'] = this.isSelected;
    data['userId'] = this.userId;
    data['assetType'] = this.assetType;
    data['make'] = this.make;
    return data;
  }
}
