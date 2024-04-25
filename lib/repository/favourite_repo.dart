import 'package:bloc_demo/model/favourite_model.dart';

class FavouriteRepository {
  Future<List<FavouriteModel>> fetchItems() async{
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavouriteModel> _generateList(int length){
    return List.generate(length, (index) => FavouriteModel(id: index.toString(), value: "Favourite $index"));
  }
}