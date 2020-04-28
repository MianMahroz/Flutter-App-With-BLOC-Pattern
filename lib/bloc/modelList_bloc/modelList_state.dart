import 'package:equatable/equatable.dart';
import 'package:flutterapp01/models/FilterResponseDto.dart';

abstract class ModelListState extends Equatable {

  @override
  List<Object> get props {}
}

class ModelListInitiated extends ModelListState{}
class ModelListLoading extends ModelListState{}
class ModelListLoaded extends ModelListState{
  List<FilterResponseDto> modelList;
  ModelListLoaded({this.modelList});
  @override
  List<Object> get props {
    return [modelList];
  }
}

