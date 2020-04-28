import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp01/bloc/modelList_bloc/modelList_event.dart';
import 'package:flutterapp01/bloc/modelList_bloc/modelList_state.dart';
import 'package:flutterapp01/models/FilterResponseDto.dart';
import 'package:flutterapp01/repositories/FilterModelListRepository.dart';

class ModelListBloc extends Bloc<ModelListEvent, ModelListState> {
  FilterModelListRepository filterModelListRepository;

  ModelListBloc({this.filterModelListRepository});

  @override
  ModelListState get initialState {
    return ModelListInitiated();
  }

  @override
  Stream<ModelListState> mapEventToState(ModelListEvent event) async* {
    if (event is FetchModelList) {
      yield ModelListLoading();
      List<FilterResponseDto> filterResponseDto = await filterModelListRepository
          .fetchModelList(event.filterRequestDto);
      yield ModelListLoaded(modelList: filterResponseDto);
    }
  }
}
