import 'package:equatable/equatable.dart';
import 'package:flutterapp01/models/FilterRequestDto.dart';
import 'package:flutterapp01/models/FilterResponseDto.dart';

abstract class ModelListEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class FetchModelList extends ModelListEvent {
  FilterRequestDto filterRequestDto;

  FetchModelList({this.filterRequestDto});

  @override
  List<Object> get props {
    return [filterRequestDto];
  }
}

class UpdateModelList extends ModelListEvent {
 final List<FilterResponseDto> modelList;

  UpdateModelList({this.modelList});

  @override
  List<Object> get props {
    return modelList;
  }
}
