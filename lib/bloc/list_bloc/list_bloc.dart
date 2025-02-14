import 'package:bloc_first/bloc/list_bloc/list_events.dart';
import 'package:bloc_first/bloc/list_bloc/list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListState(mData: [])){
    on<AddMapEvent>((event,emit){
      var currData = state.mData;
      currData.add(event.newMap);
      emit(ListState(mData: currData));
    });
    on<FetchMapEvents>((event,emit){
      emit(ListState(mData: state.mData));
    });
    on<UpdateMapEvent>((event,emit){
      var currData = state.mData;
      currData.add(event.updateMap);
      emit(ListState(mData: currData));
    });
  }
}