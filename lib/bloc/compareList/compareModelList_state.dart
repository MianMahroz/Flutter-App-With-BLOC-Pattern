import 'package:equatable/equatable.dart';
import 'package:flutterapp01/models/FilterResponseDto.dart';

abstract class CompareModelListState extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class CompareModelListInitiated extends CompareModelListState {}

class CompareModelListUpdated extends CompareModelListState {
  final List<FilterResponseDto> compareModelList;

  CompareModelListUpdated({this.compareModelList});

  @override
  List<Object> get props {
    return compareModelList;
  }
}
