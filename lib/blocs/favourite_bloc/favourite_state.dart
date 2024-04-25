import 'package:equatable/equatable.dart';
import '../../model/favourite_model.dart';


enum ListStatus {
  Laoding, Success, Failed

}
 class FavouriteState extends Equatable {

   List<FavouriteModel> favouriteList;

   ListStatus listStatus;

   FavouriteState({this.favouriteList = const [],this.listStatus = ListStatus.Laoding});

   FavouriteState copyWith({ List<FavouriteModel>? favouriteList ,ListStatus?  listStatus , List<FavouriteModel>? tempFavouriteList}){
     return FavouriteState(favouriteList: favouriteList ?? this.favouriteList,listStatus: listStatus ?? this.listStatus);
   }

   @override
   List<Object?> get props => [favouriteList, listStatus];
}