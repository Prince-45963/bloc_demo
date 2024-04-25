import 'package:bloc/bloc.dart';
import 'package:bloc_demo/blocs/favourite_bloc/favourite_event.dart';
import 'package:bloc_demo/blocs/favourite_bloc/favourite_state.dart';

import '../../model/favourite_model.dart';
import '../../repository/favourite_repo.dart';
class FavouriteBloc extends Bloc<FavouriteEvent,FavouriteState>{
  FavouriteRepository? favouriteRepository;
  List<FavouriteModel>? favouriteList;
  List<FavouriteModel>? deleteList;
  FavouriteBloc({this.favouriteRepository, this.favouriteList,this.deleteList}):super(FavouriteState()){
    on<FetchFavouriteItemsEvent>(_fetchData);
    on<AddFavouriteEvent>(_addFavourite);
    on<SelectUnselectEvent>(_selectUnselect);

    on<RemoveFavouriteEvent>(_removeEvent);

  }

  Future<void> _fetchData(FetchFavouriteItemsEvent events, Emitter<FavouriteState> emit ) async {
    favouriteList = await favouriteRepository?.fetchItems();
    emit(state.copyWith(favouriteList: List.from(favouriteList!),listStatus: ListStatus.Success,tempFavouriteList: []));
  }

  Future<void> _addFavourite(AddFavouriteEvent events, Emitter<FavouriteState> emit ) async {
   int? index =  favouriteList?.indexWhere((element) => element.id==events.favouriteModel.id);
   favouriteList![index!]  = events.favouriteModel.copyWith(isFavourite: !events.favouriteModel.isFavourite);
    emit(state.copyWith(favouriteList: List.from(favouriteList!),listStatus: ListStatus.Success,tempFavouriteList: []));
  }
  Future<void> _selectUnselect(SelectUnselectEvent events, Emitter<FavouriteState> emit ) async {
    int? index =  favouriteList?.indexWhere((element) => element.id==events.favouriteModel.id);
    favouriteList![index!]  = events.favouriteModel.copyWith(isDeleting: !events.favouriteModel.isDeleting);
    if(!events.favouriteModel.isDeleting) {
      deleteList?.add(events.favouriteModel.copyWith(
          isDeleting: !events.favouriteModel.isDeleting));
    }
    else{
      deleteList?.remove(events.favouriteModel.copyWith(
          isDeleting: !events.favouriteModel.isDeleting));
    }
    emit(state.copyWith(favouriteList: List.from(favouriteList!),listStatus: ListStatus.Success,tempFavouriteList: []));
  }

  void _removeEvent(RemoveFavouriteEvent events, Emitter<FavouriteState> emit ){
    for(int i=0;i<deleteList!.length;i++){
      favouriteList?.remove(deleteList![i]);


    }
    emit(state.copyWith(favouriteList: List.from(favouriteList!),listStatus: ListStatus.Success,tempFavouriteList: []));

  }

}