import 'package:equatable/equatable.dart';
import 'package:flutterapp01/models/FilterResponseDto.dart';

abstract class CompareModelListEvent extends Equatable {
  @override
  List<Object> get props {
    return [];
  }
}

class AddToCompareModelList extends CompareModelListEvent {
  final FilterResponseDto filterResponseDto;

  AddToCompareModelList({this.filterResponseDto});
}
