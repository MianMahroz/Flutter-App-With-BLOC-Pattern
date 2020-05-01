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
      var inputModelObject =
          modelList.firstWhere((obj) => obj.modelName == modelObj.modelName);
      //Deselect if already selected
      if (inputModelObject.selected) {
        inputModelObject.selected = false;
        var inputModelObjectIndex = modelList.indexOf(inputModelObject);
        modelList.removeAt(inputModelObjectIndex);
        modelList.insert(inputModelObjectIndex, inputModelObject);
        modelListBloc.add(UpdateModelList(modelList: modelList));
      } else {
        inputModelObject.selected = true;
        var inputModelObjectIndex = modelList.indexOf(inputModelObject);
        modelList.removeAt(inputModelObjectIndex);
        modelList.insert(inputModelObjectIndex, inputModelObject);
        modelListBloc.add(UpdateModelList(modelList: modelList));
      }

      //updating compare model list
      if (state is CompareModelListUpdated) {
        List<FilterResponseDto> compareModelList = state.props;
        if (null != compareModelList && compareModelList.isNotEmpty) {
          // if already in compare list then delete model from list
          var compareModelFilteredList = compareModelList
              .where((obj) => obj.modelName == modelObj.modelName)
              .toList();
          //if not null then delete the obj from compare list
          if (null != compareModelFilteredList &&
              compareModelFilteredList.isNotEmpty) {
            var inputCompareModelObjectIndex =
                compareModelList.indexOf(compareModelFilteredList.elementAt(0));
            compareModelList.removeAt(inputCompareModelObjectIndex);
            yield CompareModelListInitiated();
            yield CompareModelListUpdated(compareModelList: compareModelList);
          } else {
            compareModelList.add(inputModelObject);
            yield CompareModelListInitiated();
            yield CompareModelListUpdated(compareModelList: compareModelList);
          }
        } else {
          yield CompareModelListUpdated(compareModelList: [inputModelObject]);
        }
      } else {
        yield CompareModelListUpdated(compareModelList: [inputModelObject]);
      }
    }
  }
}
