import 'package:bloc/bloc.dart';
import 'package:bloc_demo/model/favourite_model.dart';
import 'package:equatable/equatable.dart';
abstract class FavouriteEvent extends Equatable {
  @override
  List<Object?> get props =>[];

}

class FetchFavouriteItemsEvent extends FavouriteEvent
{


}

class AddFavouriteEvent extends FavouriteEvent {
  FavouriteModel favouriteModel;
  AddFavouriteEvent({required this.favouriteModel});

}

class SelectUnselectEvent extends FavouriteEvent {
  FavouriteModel favouriteModel;
  SelectUnselectEvent({required this.favouriteModel});
}

class RemoveFavouriteEvent extends FavouriteEvent{

}



