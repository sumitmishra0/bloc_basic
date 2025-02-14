abstract class ListEvent {}

class AddMapEvent extends ListEvent{
  Map<String,dynamic> newMap;
  AddMapEvent({required this.newMap});
}

class UpdateMapEvent extends ListEvent{
  Map<String,dynamic> updateMap;
  int index;
  UpdateMapEvent({required this.updateMap,required this.index});
}

class DeleteMapEvent extends ListEvent{
  int index;
  DeleteMapEvent({required this.index});
}

class FetchMapEvents extends ListEvent{}