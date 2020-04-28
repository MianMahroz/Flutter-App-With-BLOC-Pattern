import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/compareList/compareModelList_event.dart';
import 'package:flutterapp01/bloc/compareList/compareModelList_state.dart';
import 'package:flutterapp01/bloc/modelList_bloc/modelList_bloc.dart';
import 'package:flutterapp01/bloc/modelList_bloc/modelList_event.dart';
import 'package:flutterapp01/bloc/modelList_bloc/modelList_state.dart';
import 'package:flutterapp01/models/FilterResponseDto.dart';

class CompareModelListBloc
    extends Bloc<CompareModelListEvent, CompareModelListState> {
  ModelListBloc modelListBloc;

  CompareModelListBloc({this.modelListBloc});

  @override
  CompareModelListState get initialState {
    return CompareModelListInitiated();
  }

  @override
  Stream<CompareModelListState> mapEventToState(
      CompareModelListEvent event) async* {
    if (event is AddToCompareModelList) {
      var modelObj = event.filterResponseDto;
      List<FilterResponseDto> modelList = modelListBloc.state.props;
      var inputModelObject = modelList.firstWhere((obj) =>
          obj.modelIdPk == modelObj.modelIdPk &&
          obj.assetTypeId == modelObj.assetTypeId &&
          obj.makeIdFk == modelObj.makeIdFk);
      inputModelObject.selected = true;
      var inputModelObjectIndex = modelList.indexOf(inputModelObject);
      modelList.removeAt(inputModelObjectIndex);
      modelList.insert(inputModelObjectIndex, inputModelObject);
      modelListBloc.add(UpdateModelList(modelList: modelList));

      //updating compare model list
      if (state is CompareModelListUpdated) {
        List<FilterResponseDto> compareModelList = state.props;
        if (null != compareModelList && !compareModelList.isEmpty) {
          compareModelList.add(inputModelObject);
          yield CompareModelListInitiated();
          yield CompareModelListUpdated(compareModelList: compareModelList);
        }
      } else {
        yield CompareModelListUpdated(compareModelList: [inputModelObject]);
      }
    }
  }
}
